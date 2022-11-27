## nmap
allow host detection, port scanning with service and OS specification, firewall info. and detecting/exploiting vulnerabilities (NSE - nmap script engine)  
include: 
- `ncat` - improved netcat (i.a. supports SSL, IPv6, SOCKS, http proxies and connection brokering)  
- `ndiff` - takes nmap XML output files and prints the differences between them. Can be used for detecting changes in the network  
- `nping` - packet generation and response analysis. [documentation](https://nmap.org/book/nping-man.html)  
### [phases of nmap scan](https://nmap.org/book/nmap-phases.html)
- IF `-sC` or `--script` -> **script pre-scanning** - run a collection of specia purpose NSE scripts. In that phase only scripts used are those which have to be run only once per nmap execution. Like `dhcp-discover` and `broadcast-dns-service-discovery`  
- **target enumeration** - pretty stupid name for a phase I'd say. nmap resoves host specifiers (e.g. IP addresses in binary, CIDR network notations, hostnames) into a list of IPv4 and IPv6 addresses for further scanning. If DNS give more than 1 IP nmap will scan only first one. To scan all resolved IPs use `--resolve-all`.  
If `-sL -n` nmap will JUST print out IP addresses. `-sL` is NOT meant for direct passing IPs. (`-iL` passes list of hosts). It only return a list of to-be-targeted hosts. `-n` disables reverse-DNS resolution. 
- **host discovery (ping scans)** i.a. ARPrequests (MASSIVE broadcasting), TCP scans, ICMP scans and so on. Used to make sure hosts are online for futher scanning. To skip `-Pn` (no ping, all hosts assumed online). To close just after `-sn -n` (-n for no reverse-DNS resolution)  
- **reverse-DNS resolution** of all hosts believed to be online so as to gain additional info that may be stored in DNS (e.g. firewalls are often named `fw`). `-n` to skip, `-R` to resolve all hosts (even down ones)  
- **port scanning** by default performed `-sS`. To skip `-sn`  
- **version detection** `-sV` to enable. Used if any ports are open  
- **OS detection** `-O` to enable  
- **traceroute** `--traceroute` to enable. Find niate hosts.
- IF `-sC` or `--script` -> **script scanning** - NSE scripts, generally run once per each target host and port number they interact with. Network routes. Usually involves another round of reverse-DNS resolution for the intermedmmonly used for detecting service vulnerabilities, malware discovery, collecting more information from databases and other network services, and advanced version detection.  
- **output** screen or file. It's rather advantageous to use `-v` verbose. It gives more intresting info (like IP ID in case of `-O` - maybe it's a good host for idle scan?).  
`-oN/-oX/-oS/-oG <filename>` output scan in normal, XML, s|<rIpt kIddi3, and Grepable format  
#### host discovery
`-PS/PA/PU/PY <portlist>` TCP SYN/ACK, UDP or SCTP discovery to given ports  
`-PE/PP/PM` ICMP type 8 expecting type 0 (blocked by most firewalls but might work in internal networks), ICMP code 13 (timestamp request), ICMP code 17 (network mask)
`-PO <protocol list>` "IP protocol ping"  
`-Pn` no host discovery  
`--disable-arp-ping` No ARP or IPv6 Neighbor Discovery. Useful on networks using proxy ARP, in which a router replies to all ARP requests making every target appear to be up according to ARP scan  
#### port scanning
by default nmap scans only firs 1000 most common ports
`-sS/sT/sU/sY` TCP SYN/connect, UDP, SCTP (Stream Control Transmission Protocol). TCP connect and SYN scan without root can use *connect* syscall (that is they don't need root)    
`-sN/sF/sX` TCP NULL, FIN, and Xmas scans  
`-sW` TCP Window scan  
`--scanflags` custom TCP flags. You specify how nmap is understanding responses (e.g. `-sF`) and what packets are sent 
(mash flags together e.g. `--scanflags URGACKPSHRSTSYNFIN`). Default is SYN scan understanding of replys  
`-sO` IP scan for figuring out used protocols (by ports)
#### port selection
`-p <port ranges>`port number or range. `-p-` mean all 2^16 ports  
`-p U:53,111,137,T:21-25,80,139,8080` for specifying sake. e.g. `sudo nmap -sU -sS -pT:53,U:53 -sV -sC 10.0.2.9`  
`--exclude-ports <port ranges>`  
`-r` scan ports consecutively (without randomisation)  
#### Banner grabbing
##### Service and version detection
`-sV` By default skips TCP 9100 bcos some printers print everything sent there. `--allports` will overwrite this behavior  
`--version-intensity <intensity>` default is 7. range 0-9  
##### OS detection
`-O`  
OS detection is far more effective if at least one open and one closed TCP port are found. `--osscan-limit` limit OS detection to promising targets  
#### NSE
Categories: *auth*, *broadcast*, *brute*, *default*. *discovery*, *dos*, *exploit*, *external*, *fuzzer*, *intrusive*, *malware*, *safe*, *version* (used by `-sV`), and *vuln*
`-sC` aka `--script=default`. Some of them are intrtusive.  
`--script-help <filename>|<category>|<directory>|<expression>|all[,...]` help about a scripts. For individual scripts e.g. `nmap --script-help ftp-anon` or for categories `nmap --script-help default`  
`--script <filename>|<category>|<directory>/|<expression>[,...]` Each element is interpreted first as an expression, then as a category, and finally as a file or directory name. E.g. `nmap --script "http-*"`, `nmap --script "not intrusive"` - every script except from *intrusive* category, `nmap --script "default or safe"` - in *default*, *safe* or both, `nmap --script "default and safe"`, `nmap --script "(default or safe or intrusive) and not http-*"`  

`-A` OS detection • version detection • script scanning • traceroute  

### netcat (and maybe ncat?)
### nping
### hping
### ping
### unicornscan

### Crafting custom packets:
hping
nping
NetScanTools - paid for Windows
Colasoft Packet Builder - seems cool and easy
Packeth - seems 

### python >:)
