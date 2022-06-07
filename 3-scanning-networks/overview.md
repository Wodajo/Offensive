Host discovery -> Port scanning & Banner grabbing -> Searching for vulnerabilities

"ping sweep" -  using ICMP echo request to look for active hosts by quering IP addresses one by one (queries of broadcast addresses often blocked)

### Host discovery
#### nmap
`-n/R` no/always DNS resolution (default sometimes:p)
In local ethernet network ARP requests are always used. Unless `--send-ip` or `--disable-arp-ping`

`-sn` no port scans after host discovery. Use ICMP echo request, TCP SYN to port 443, TCP ACK to port 80, and an ICMP timestamp request for host discovery
`-Pn` no host discovery, pass given IPs like with `-sL` (list scan)
To skip host discovery & port scanning BUT use NSE `-Pn -sn`
`-P*` use all probe scans. (Loong, especially UDP)
  `-PS/PA/PU/PY <portlist>` TCP SYN/ACK, UDP or SCTP discovery to given ports
  `-PE/PP/PM` ICMP type 8 expecting type 0 (blocked by most firewalls but might work in internal networks), ICMP code 13 (timestamp request), ICMP code 17 (network mask)
  `-PO <protocol list>` "IP protocol ping"
`--disable-arp-ping` No ARP or IPv6 Neighbor Discovery. Useful on networks using proxy ARP, in which a router replies to all ARP requests making every target appear to be up according to ARP scan
`--traceroute` typical traceroute using ICMP Time Exceeded
#### hping3
lower level & stealthier than nmap BUT can be used on 1 host and doesn't support IPv6
rather for port scanning and bypassing firewall rules
  `ping -1 10.0.0.x --rand-dest -I eth0`
        `-1` ICMP mode
        `--rand-dest` random destionation address mode
        `-I <interface>` network interface name
**If ICMP return of type 3 with a code of 13 indicates a poorly configured firewall**
#### ping - rather useless
ICMP broadcast `ping -b 192.168.129.255` (last address of a network is broadcast ID)
This will populate arp table. To show `arp -a`



Common ports for scanning:
21 tcp FTP
22 tcp SSH
23 tcp telnet
25 tcp SMTP
53 tcp/udp DNS
80 tcp HTTP/1.0 HTTP/1.1 HTTP 1.2
80 udp HTTP/3 (use QUIC)
123 tcp NTP Network Time Protocol
443 tcp/udp HTTPS
500 tcp/udp IKE/IPSec Internet Key Exchange/IPSec
631 tcp/udp IPP InternetPrinting Protocol
3389 tcp/udp RDP Remote Desktop Protocol
9100 tcp/udp AppSocket/JetDirect (HP JetDirect, Printer PDL (page description language) Data Stream)
