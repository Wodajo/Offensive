Allow host detection, port scanning with service and OS specification, firewall info and detecting/exploiting vulnerabilities (NSE - nmap script engine)  
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
- IF `-sC` or `--script` -> **script scanning** - NSE scripts, generally run once per each target host and port number they interact with. Coetwork routes. Usually involves another round of reverse-DNS resolution for the intermedmmonly used for detecting service vulnerabilities, malware discovery, collecting more information from databases and other network services, and advanced version detection.  
- **output** screen or file. It's rather advantageous to use `-v` verbose. It gives more intresting info (like IP ID in case of `-O` - maybe it's a good host for idle scan?).  
`-oN/-oX/-oS/-oG <filename>` output scan in normal, XML, s|<rIpt kIddi3, and Grepable format  

### host discovery
`sudo nmap -PR -sn 192.168.1.0/24` ARP scan

`sudo nmap -sn 192.168.1.0/24`  use ICMP echo request, TCP SYN to port 443, TCP ACK to port 80, and an ICMP timestamp. Omits further ports scanning.

`sudo nmap --disable-arp-ping -PM -PO -PY -sn 192.168.1.0/24` disables ARP and IPv6 Neighbor Discovery.  
Some networks using proxy ARP, in which a router replies to all ARP requests making every target appear to be up according to ARP scan. (**Don't work on LAN**)  
`-PM` ICMP netmask, `-PO` IP scan, `-PY` SCTP scan  

"Bruteforce" checking with blind port scanning:
`sudo nmap --resolve-all --disable-arp-ping -Pn -p- -sS -sY hostname`  
`resolve-all` applies only when nmap has to resolve names with DNS. By default it takes only first IP  
`-Pn` to omit default host discovery  
Than blindly scan every port on every maybe-existing host.  
Probably best to firstly run `sudo nmap --resolve-all --disable-arp-ping -sL -n 10.0.2.0/24 | grep report| awk '{print $(NF)}' > full_list.txt` -> cut it into smaller pieces. (`-n` disable reverse-DNS resolution we just want to print targets for now)  
and than `sudo nmap -Pn -p- -sS -sY -iL list.txt`  

`sudo nmap -PU 192.168.1.0/24`  
Send UDP datagram on probably empty port (processes would most likely drop empty datagram and we want response. Default port is 40125. You can change it in `DEFAULT_UDP_PROBE_PORT_SPEC` in `nmap.h`)  

### port scanning
`sudo nmap -Pn -sS -sY -sO -sU -p U:53,67,68,161,162,T:1-65535 -iL list_of_targets_IP`
`-Pn` assume passed targets online, `-sS` SYN scan, `-sY` SCTP scan, `-sO` IP scan, `-sU` UDP scan, `-iL` to pass list of targets  

#### IDLE scan:
for zombie search it might be good to use `ipidseq.nse`  (to check how IP ID increments)  
`sudo nmap -Pn -p- -sI <zombie IP/hostname:sendingport> <target IP/hostname>`  
We can check if the zombie "sending" port is open with SYN ping.  
`-Pn` for sneakyness sake (to avoid host detection)  

### banner grabbing
`sudo nmap -sU -sS -p T:53,U:53 -sV 192.168.1.128`  
by default `-sV` skips TCP 9100 bcos some printers print everything sent there. `--allports` overwrite this behavior

`sudo nmap -O --osscan-limit` i.a. TCP ISN sampling, TCP options support and ordering, IP ID sampling, and the initial window size check.  
OS detection is far more effective if at least one open and one closed TCP port are found. `--osscan-limit` limit OS detection to promising targets  

### NSE
Categories: *auth*, *broadcast*, *brute*, *default*. *discovery*, *dos*, *exploit*, *external*, *fuzzer*, *intrusive*, *malware*, *safe*, *version* (used by `-sV`), and *vuln*

`sudo nmap -pT:445 --script "(default and not intrusive) or http-*" 192.168.1.128`  
`-sC` aka `--script=default` some of them are intrusive  

 `nmap --script-help ftp-anon` or for categories `nmap --script-help default`  

`-A` OS detection • version detection • script scanning • traceroute  


### packet tracing
`sudo nmap -sS -p- --packet-trace 192.168.1.128`  
show all sent and received packets (and standard output)

### packet fragmentation
**Why data must be a multiple of 8 bytes??**
`--mtu SizeInBytes-MultiplicationOf8`
works for raw packet features (TCP&UDP scans [except FTP bounce and -sT], OS detection)  
NOT for NSE (like `-sV`, `-sC`) - depend on TCP stack

`sudo nmap --mtu 8 -sS 192.168.1.124`

carefull - check with `wireshark` if your OS is truly fragmenting them (might be problems with kernel)  

 `--send-eth` if kernel cause problems (bypass IP layer and directly send ethernet frames)