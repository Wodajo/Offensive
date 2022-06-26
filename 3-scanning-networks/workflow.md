`ip a` to know your IP  
`route`  for routing table (based on routing protocols which you don't know yet)  
`sudo apr-scan 10.0.2.0/24` rather stealthy host discovery on LAN  
UPDATE AFER LABS WITH NOT-LAN SCANNING
`sudo nmap --disable-arp-ping -PM -PO -PY -sn 10.0.2.0/24` disables ARP and IPv6 Neighbor Discovery.  
Some networks using proxy ARP, in which a router replies to all ARP requests making every target appear to be up according to ARP scan. On LAN ARP is needed to send ethernet frames (?) - ARP brodcast will happen anyway  
`-sn` use ICMP echo request, TCP SYN to port 443, TCP ACK to port 80, and an ICMP timestamp, omits further ports scanning.  
`-PM` ICMP netmask, `-PO` IP scan, `-PY` SCTP scan  
That's all default host discovery nmap scans except UDP (slow)  
UPDATE AFTER FW RESEARCH
If you're desperate - use blind port scanning for host discovery:  
**It would be good to test if/how the fw is working here** - update later  

`sudo nmap -PU -sn 10.0.2.0/24` or `sudo unicornscan -mU 10.0.2.0/24`  
unicornscan is faster - mostly ARP, investigate further with wireshark  

"Bruteforce" checking if ports other than 80 and 443 (`-sn` port discovery)  
`sudo nmap --resolve-all --disable-arp-ping -Pn -p- -sS -sY hostname`  
`resolve-all` applies only when nmap has to resolve names with DNS. By default it takes only first IP  
`-Pn` to omit default host discovery  
Than blindly scan every port on every maybe-existing host.  
Probably best to firstly run `sudo nmap --resolve-all --disable-arp-ping -sL -n 10.0.2.0/24 | grep report| awk '{print $(NF)}' > full_list.txt` -> cut it into smaller pieces  
and than `sudo nmap -Pn -p- -sS -sY -iL list.txt`  
