RTT round trip time

### ICMP
part of the IP protocol (3rd layer) - doesn't have port abstraction like 4th layer  
often blocked by firewalls - no response.
Type 3 code 13 (destination unreachable: communication administratively prohibited) in poorly configured firewalls  
##### Broadcast ICMP type 8
send ICMP type 8 (echo request) to broadcast address (that is to every address on a subnet). E.g. `ping -b 192.168.129.255`  
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
##### SYN ping
send empty segment with `SYN` flag. If response is `SYN/ACK` - port is open, if `RST` - port is closed. With any host is up.  
Than kernel (not nmap) responds with `RST` and close connection.  
program needs root to use syscall for sending raw TCP packets. BUT it can use `connect` syscall as workaround. 
If quick success or an `ECONNREFUSED` failure - the underlying TCP stack must have received a SYN/ACK or RST. If timeout - host is down.
Fast, reliable, stealthy (TCP connection is not established - may bypass logging and firewalls)  
`sudo nmap -PS` only host discovery. Default port is 80. `-PS22-25,80,113,1050,35000` you can pass arguments like with `-p`  
`sudo nmap -sS` ports scanning. Port `filtered` if timeout or ICMP type 3(destination unreachable) code 0, 1, 2, 3, 9, 10, or 13  
`sudo hping -8 <port list> -S <ip address> -V` `-8` scan mode, `-S` SYN flag, `V` verbose  
##### TCP connect
Use *connect* syscall to create full TCP connection. Doesn't need root  
Longer, very likely logged.  
`nmap -sT`
##### ACK scan
send segment with `ACK` flag  
used for mapping out firewall rulesets  
It is common to block incoming SYN packets except for those destined for public services, like the company web site or mail server. When such stateless rules are in place SYN ping won't cut through firewall to other ports than predicted. But ACK flagged segment might.  
if unfiltered - `open` and `closed` ports will both return `RST`. That also means that host is alive  
if timeout or ICMP ureachable - filtered. Firewall doesn't allow `ACK` without session - that is stateful firewall)  
Relies mostely on timeouts - slow  
`sudo nmap -PA` host discovery  
`sudo nmap -sA` port scan  
`sudo hping -A <ip address> -p <port number>` or `sudo hping -8 <ports list> -A <ip address> -V`
Some stateful firewalls drop everything that looks out of place (like `ACK` without session above). In that scenario it might be better to use SYN ping. It would be best to send both segemnts (e.g. `-PA`&`-PS`)
###### ACK classification
if we've got `RST` we can predict if port is closed or open using it's `Window` and `TTL` fields  
if `Window` field != 0 - open. Most likely won't work, might work in opposite way.  
`sudo nmap -sW`
if `TTL` < 64 while other packets have higher TTL. As I understand TTL can be governed by Application Control > Custom Service > Policy > System configuration. Higher level instances override lower, thus if a port is open packet might have other TTL than the default kernel-cofigurated ones.  
`sudo hping -8 <ports list> -A <ip address> -V` ttl&win included in responses
##### according to RFC 793...
segment not containing `SYN`, `RST`, or `ACK` bits will result in `RST` (if the port is closed) or no reponse (if port open)  
Very stealthy but modern IDS can be configured to detect it.  
Unfotunately many devices don't follow RFC. Some send `RST` responses to the probes regardless of whether the port is open or not. This causes all of the ports to be labeled `closed`. Windows and many CISCO and IBM devises doeas it.  
There could also be false positives:D  
You can check manually e.g. nmap `--scanflags` (2^3 = 8 permutations) or use most popular combinations - XMAS, NULL scan and FIN scan
###### XMAS
send segments with `FIN`, `URG` and `PUSH` flags. Xmas bcos segment is decorated like christmas tree  
If response `RST` - closed  
if ICMP unreachable - open/**filtered**  
if timeout - filtered  
`sudo nmap -sX`  
`sudo hping -8 <ports> -F -U -P <ip address> -V` -F for FIN, -P for PUSH, -U for URG  
###### Null scan
send segment with TCP header flag 0 (no bits set)  
`sudo nmap -sN`  
###### FIN scan
`FIN` bit set  
`sudo nmap -sF`  
##### IDLE scan
utilizes IP addresses of zombie machine through IP spoofing  
basic facts used for scan:
- `SYN` result in `SYN/ACK` (open port) or `RST` (closed port)
- unsolicited `SYN/ACK` result in `RST`. Unsolicited `RST` is ignored
- every IP packet has IP ID (fragment identification number). Most OS increase this number with each **sent** packet - it's possible to estimate how many packets was sent from last one.  
But this doesn't have to be true - zombie host might not have predictable IP ID:/  
  
`SYN/ACK` to zombie -> zombie respond with `RST` with it's IP ID (probing) -> Forge a SYN packet "from the zombie" (spoof IP) and send it to the desired port on the target.  
IF port is open&not filtered -> target responds to zombie with `SYN/ACK`-> zombie responds with `RST` (IP ID increase by 1)  
IF port is closed -> target responds to zombie with `RST` -> zombie ignore `RST` (IP ID not changed)  
IF port is filtered -> target doesn't respond to zombie -> IP ID not changed  
-> Probe the zombie's IP ID again.  
IF IP ID increased by 2 - port is open and not filtered.  
IF IP ID increased by 1 (increased only by probe `RST`) - port is closed or filtered (both by firewall before target and between target and zombie)
IF IP ID increased by >2 - bad zombie. Doesn't use predictable IP ID or was sending other packets during scan.

Super sneaky. Can mislead IDS and IP-trust based firewalls  
Very long (bcos timeouts)  
Many ISP's block spoofing attempts with egress firewalls (that is firewalls monitoring traffic going out of ISP infrastructure). Sometimes they block spoofing of only IPs from outside range of IPs used by their customers (resonable).  
Fist you have to find an idle host fitting to be your zombie. It is best to choose hosts with low latency with in relation to target. (faster scan and therefore eith lower chances that there will be some unwanted sending on a side)  
for zombie search it might be good to use `sudo hping3 -S -A <zombie IP>` to check if it gives `RST` response & see how IP ID is incremented  
`sudo nmap -Pn -sI -p- <zombie IP/hostname:sendingport> <target IP/hostname>` We can check if the zombie "sending" port is open with SYN ping.
`-Pn` used to avoid host detection - for sneakyness sake  
https://nmap.org/book/idlescan.html
### SCTP
SCTP is an UDP and TCP alternative. Scan seems alike TCP SYN 
##### INIT scan
send an `INIT chunk`, as if you are going to open a real association and then wait for a response.  
`INIT-ACK chunk` - open  
`ABORT chunk` - close  
ICMP unreachable error (type 3, code 0, 1, 2, 3, 9, 10, or 13) or timeout - filtered.  
`sudo nmap -sY`  
##### COOKIE ECHO scan
send chunks with `COOKIE ECHO`  
if timeout (chunk is dropped or filtered) - open/filtered  
if `ABORT` - closed  
There may be non-stateful firewall blocking INIT chunks but not COOKIE ECHO
`sudo nmap -sZ`
### UDP ping
connectionless stream protocol.  
i.a. DNS 53, SNMP 161/162 (Simple Network Management Protocol), DHCP 67/68  

Bypass many firewalls BUT pretty fking long (Linux kernel limits ICMP responses to 1/s and timeouts) and open&filtered ports rarely send any response.
`sudo nmap -PU <port list>` host discovery. Send UDP datagram on probably empty port (processes would most likely drop empty datagram and we want response. Default port is 40125. You can change it in `DEFAULT_UDP_PROBE_PORT_SPEC` in `nmap.h`). If ICMP port unreachable - host seems up. If other ICMP error, TTL exceed or timeout - host is dead or unreachable (firewall?)  
`sudo nmap -sU` port scanning. If an ICMP port unreachable error (type 3, code 3) is returned - closed. Other ICMP unreachable errors (type 3, codes 0, 1, 2, 9, 10, or 13) - filtered. If no reponse - open/filtered (we're assuming firewall eaten responses) -> sV might provide more info.  
`sudo unicornscan -mU <addresses>` -mU mode UDP. Somehow much faster. Wierd  
`sudo hpingh -2 <ip address> -p <port number>` for one port. Not that cool:/
### ARP scan
send regular ARP requests looking for MAC addresses  
usefull on LAN  
You can't use layer 2 protocol to scan e.g. other subnet  
e.g. VPN interface is a 3rd layer entity so no arp scanning here
`sudo nmap -PR -sn '192.168.0.*'` -PR ARP discovery  
`sudo arp-scan -I wlan0 <addressIP/24>` -I interface  
`sudo netdiscover -r 10.0.2.1/24` -r range (not autoscan)  
`ip n` or `ip neigh` show ARP table of current host  
 



