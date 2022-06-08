RTT round trip time

### ICMP
part of the IP protocol (3rd layer) - doesn't have port abstraction like 4th layer  
often blocked by firewalls - no response. Type 3 code 13 (destination unreachable: communication administratively prohibited) in poorly configured firewalls  
##### Broadcast ICMP type 8
send ICMP type 8 (echo request) to broadcast address (that is to every address on a subnet). E.g. `ping -b 192.168.129.255`  
Populate arp table. `arp -a` to display  
Useless.  
Blocked e.g. bcos of smurf attack (flooding a IP broadcast with ICMP echo request packets with victim IP address as source.
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
