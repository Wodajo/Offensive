`ip a` to know your IP  
`route`  for routing table (based on routing protocols which you don't know yet)  
`sudo apr-scan 10.0.2.0/24` rather stealthy host discovery on LAN  

`sudo --disable-arp-ping -PM -PO -PY -sn 10.0.2.0/24` disables ARP and IPv6 Neighbor Discovery.  
Some networks using proxy ARP, in which a router replies to all ARP requests making every target appear to be up according to ARP scan.  
`-sn` use ICMP echo request, TCP SYN to port 443, TCP ACK to port 80, and an ICMP timestamp AND omits further ports scanning.  
`-PM` ICMP netmask, `PO` IP scan, `-PY` SCTP scan  
All default host discovery nmap scans except UDP (slow)  

If you're desperate:
`sudo nmap -PU 10.0.2.0/24` or `unicornscan -mU 10.0.2.0/24`  
unicornscan is somehow faster - investigate with wireshark.  

**It would be good to test if/how the fw is working here** - update later

"Bruteforce" checking if ports other than 80 and 443 (`-sn` port discovery)  
`sudo nmap --resolve-all --disable-arp-ping -Pn -p- -sS -sY hostname`  
`resolve-all` applies only when nmap has to resolve names with DNS. By default it takes only first IP  
`-Pn` to omit default host discovery  
Than blindly scan every port on every maybe-existing host.  
Probably best to firstly run `sudo nmap --resolve-all --disable-arp-ping -sL -oN every_possible_IP.txt`, cut it into smaller pieces  
and than `sudo nmap -Pn -p- -sS -sY -iL list.txt`  
I omitted `-sU` bcos for every port it would take eons  
