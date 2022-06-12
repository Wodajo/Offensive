### nmap
allow host detection, port scanning with service and OS specification, firewall info. and detecting/exploiting vulnerabilities (NSE - nmap script engine)  
include: 
- `ncat` - improved netcat (i.a. supports SSL, IPv6, SOCKS, http proxies and connection brokering)  
- `ndiff` - takes nmap XML output files and prints the differences between them. Can be used for detecting changes in the network  
- `nping` - packet generation and response analysis. [documentation](https://nmap.org/book/nping-man.html)  
##### [phases of nmap scan](https://nmap.org/book/nmap-phases.html)
IF `-sC` or `--script` -> **script pre-scanning** - run a collection of specia purpose NSE scripts. In that phase only scripts used are those which have to be run only once per nmap execution. Like `dhcp-discover` and `broadcast-dns-service-discovery`  
**target enumeration** - pretty stupid name for a phase I'd say. nmap resoves host specifiers (e.g. IP addresses in binary, CIDR network notations, hostnames) into a list of IPv4 and IPv6 addresses for further scanning. If `-sL -n` nmap will JUST print out IP addresses. `-sL` is NOT meant for passing IPs, it's just to check what would be passed into scanning, and `-n` disables reverse-DNS resolution.  
**host discovery (ping scans)** i.a. ARPrequests, TCP scans, ICMP scans and so on. Used to make sure hosts are online for futher scanning. To skip `-Pn` (no ping, all hosts assumed online). To close just after `-sn -n` (-n for no reverse-DNS resolution)  
**reverse-DNS resolution** of all hosts believed to be online so as to gain additional info that may be stored in DNS (e.g. firewalls are often named `fw`). `-n` to skip, `-R` to resolve all hosts (even down ones)  
**port scanning** by default performed `-sS`. To skip `-sn`  
**version detection** `-sV` to enable. Used if any ports are open  
**OS detection** `-O` to enable  
**traceroute** `--traceroute` to enable. Find network routes. Usually involves another round of reverse-DNS resolution for the intermediate hosts.
IF `-sC` or `--script` -> **script scanning** - NSE scripts, generally run once per each target host and port number they interact with. Commonly used for detecting service vulnerabilities, malware discovery, collecting more information from databases and other network services, and advanced version detection.  
**output** screen on file. It's rather advantageous to use `-v` verbose. It gives more intresting info (like IP ID in case of `-O` - maybe it's a good host for idle scan?).  
`-oN/-oX/-oS/-oG <filename>` output scan in normal, XML, s|<rIpt kIddi3, and Grepable format  
#####

`-A` OS detection • version detection • script scanning • traceroute


### netcat
### hping
### ping
### unicornscan (own implementation of the TCP/IP stack and not operating system's - faster, but... why?)
Seems like this unicorn can somehow flood linux 2.x AND STILL GET RESULTS. Check if thats just a M2 thing, or if thats a standard o.o


### Crafting custom packets:
hping
nping
NetScanTools - paid for Windows
Colasoft Packet Builder - seems cool and easy
Packeth - seems 

### python >:)

### enum4linux
