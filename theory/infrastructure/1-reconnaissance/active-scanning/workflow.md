`ip a` to know your IP  
`ip r`  for routing table (based on routing protocols which you don't know yet)  

- scan for hosts
- 
`sudo arp-scan 10.0.2.0/24` ARP broadcast -> host discovery *on LAN*  

**On LAN ARP is needed to send ethernet frames - ARP brodcast must happen**  

`sudo nmap --disable-arp-ping -PM -PO -PY -sn 10.0.2.0/24` disables ARP and IPv6 Neighbor Discovery.  
Some networks using proxy ARP, in which a router (proxy ARP server) replies to all ARP requests making every target appear to be up according to ARP scan. (Only for LAN - you can't do ARP scan outside of LAN)
`-sn` use ICMP echo request, TCP SYN to port 443, TCP ACK to port 80, and an ICMP timestamp, omits further ports scanning.  
`-PM` ICMP netmask, `-PO` IP scan, `-PY` SCTP scan  

That's all of default host discovery nmap scans except UDP (slow)  
`sudo nmap -PU -sn 10.0.2.0/24` is not working on LAN - only ARP (bcos UDP frame wouldn't pass to host either way)

If you're desperate - use blind port scanning for host discovery:  

`sudo unicornscan -mU 192.168.1.0/24` (seems like `unicornscan` is not UDP scanning anything else than gateway and broadcast. `wireshark` filter `(udp) && (ip.src == 192.168.1.180)`

- scan for network services (and/or bruteforce host discovery)

"Bruteforce" checking if ports other than 80 and 443 (from `-sn` port discovery)  
`sudo nmap --resolve-all --disable-arp-ping -Pn -p- -sS -sY hostname`  
`resolve-all` applies only when nmap has to resolve names with DNS. By default it takes only first IP  
`-Pn` to omit default host discovery  
Than blindly scan every port on every maybe-existing host.  
Probably best to firstly run `sudo nmap --resolve-all --disable-arp-ping -sL -n 10.0.2.0/24 | grep report| awk '{print $(NF)}' > full_list.txt` -> cut it into smaller pieces  
and than `sudo nmap -Pn -p- -sS -sY -iL list.txt` 

- check versions
**if you can be loud**
nmap `-sA` - OS detection, version, default script & traceroute


- check if this versions of services have known vulnerabilities, prepare potential exploits

- if there is a website -> webapp recon
