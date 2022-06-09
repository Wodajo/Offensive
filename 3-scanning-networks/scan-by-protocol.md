RTT round trip time

### ICMP
part of the IP protocol (3rd layer) - doesn't have port abstraction like 4th layer  
often blocked by firewalls - no response. Type 3 code 13 (destination unreachable: communication administratively prohibited) in poorly configured firewalls  
##### Broadcast ICMP type 8
send ICMP type 8 (echo request) to broadcast address (that is to every address on a subnet). E.g. `ping -b 192.168.129.255`  
Populates arp table. `arp -a` to display  
Useless.  
Blocked e.g. bcos of smurf attack (flooding an IP broadcast with ICMP echo request packets with victim IP address as source.
Causes hosts in the network respond to received requests targeting the victim -> DoS)
##### ICMP type 8 (echo request) aka ping sweep
Rather blocked on firewalls. Might work in internal network
send `ICMP type 8`, expect `ICMP type 0`  
`sudo nmap -PE` to skip port scans`-sn`  
`sudo hping -1 <target>`  
`ping <target>` ping has a SUID bit so as to use syscall for creating raw sockets (requires root).
There exist a new way of smaller privilege escalation using "capabilities".
##### ICMP type 13 (timestamp request)
`sudo nmap -PP`  
`sudo hping -1 <target> --icmptype 13`  
##### ICMP type 17 (address mask request)
`sudo nmap -PM`  
`sudo hping -1 <target> --icmptype 17`  
### TCP
##### SYN scan
send empty packet with `SYN flag`. If response is `SYN/ACK` - port is open, if `RST` - port is closed. In both host is up.  
Than kernel (not nmap) responds with `RST` and close connection.  
program needs root to use syscall for sending raw TCP packets. BUT it can use `connect` syscall as workaround. 
If quick success or an `ECONNREFUSED` failure - the underlying TCP stack must have received a SYN/ACK or RST. If timeout - host is down.
Fast, reliable, stealthy (TCP connection is not established - may bypass logging and firewalls)  
`sudo nmap -PS` only host discovery. Default port is 80. `-PS22-25,80,113,1050,35000` you can pass arguments like with `-p`  
`sudo nmap -sS` ports scanning. Port `filtered` if timeout or ICMP type 3(destination unreachable) code 0, 1, 2, 3, 9, 10, or 13  
`sudo hping -8 <port list> -S <ip address> -V` `-8` scan mode, `-S` SYN flag, `V` verbose  
##### according to RFC 793...
packet not containing `SYN`, `RST`, or `ACK` bits will result in `RST` (if the port is closed) or no reponse (if port open)  
Very stealthy but modern IDS can be configured to detect it.  
Unfotunately many devices doesn't follow RFC. Some send `RST` responses to the probes regardless of whether the port is open or not. This causes all of the ports to be labeled `closed`. Windows and many CISCO and IBM devises doeas it.  
There could also be false positives:D  
You can check manually e.g. nmap `--scanflags` of use most popular combinations - XMAS, NULL scan and FIN scan
###### XMAS





