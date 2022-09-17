`ip a`
`ip r`

#### host discovery
`sudo arp-scan 192.168.1.0/24` - ofc only LAN

`sudo nmap --resolve-all --disable-arp-ping -sL hostname | grep report | awk '{print $(NF)}' > full_list_of_IPs.txt`
`--resolve-all` applies only when nmap has to resolve names with DNS. By default it takes only first IP
`--disable-arp-ping` only on LAN
(no ARP scan for host discovery - proxy ARP might make every target appear up)

`sudo nmap --disable-arp-ping -PM -PO -PY -R -sn -iL list`
`-sn` ICMP echo request & timestamp, TCP SYN to 443, TCP ACK to 80
omits further port scanning
`-PM` ICMP netmask
`-PO` IP scan
`-PY` SCTP scan
`-R` reverse-DNS-resolution for all hosts (even down ones)

`sudo nmap -PU 192.168.1.0/24`
Send UDP datagram on probably empty port (40125)
you might want to change `DEFAULT_UDP_PROBE_PORT_SPEC` in `nmap.h`


##### if desperate
you might want to omit host discovery and blind port-scan every possible host


#### port scanning

`sudo nmap -Pn -sS -sY -sU -p U:53,67,68,161,162,T:1-65535 -iL list`
`-Pn` assume passed targets online, `-sS` SYN scan, `-sY` SCTP scan, `-sO` IP scan, `-sU` UDP scan, `-iL` to pass list of targets

`sudo nmap -Pn -sO -p- -iL list`
IP scan has to be done alone
(sends IP packet headers and iterates through the eight-bit IP protocol field)

`sudo unicornscan -mU 192.168.1.0/24`
seems like `unicornscan` is not UDP scanning anything else than gateway and broadcast - IS THAT TRUE?