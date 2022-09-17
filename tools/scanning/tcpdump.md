`tcpdump OPTIONS EXPRESSION`
`EXPRESSION` in `pcap-filter` syntax

#### examples:
`tcpdump -i tun0`
`-i` interface

`tcpdump src 1.1.1.1`
`tcpdump dst 1.1.1.1`

`tcpdump port 3389`  
`tcpdump src port 1025

`tcpdump host 1.1.1.1`
`host` all coming to/from 1.1.1.1

`tcpdump net 192.168.1.0/24`
`net` all comin to/from network/subnet

`tcpdump icmp`
only that proto

`tcpdump portrange 21-23`

`tcpdump -c 1 -X icmp`
`-c` count
`-X` print `headers` of each packet and `data` of each packet (minus
its link level header) in `hex` and `ASCII`
usefull for e.g. analysing new protocols

`tcpdump ip6`
all IPv6 traffic

you can use `and`/`&&`, `or`/`||`, `not`/`!`

e.g.
all traffic from 192.168.x.x to 10.x.x.x or 172.16.x.x
`tcpdump -n src net 192.168.0.0/16 and dst net 10.0.0.0/8 or 172.16.0.0/16`
`-n` don't convert addresses to names

#### pcap-filter syntax
##### kinds of qualifiers
- `type` - qualifiers specify what kind of thing the `id`, `name` or `number` refers to.  
  Possible *types* are `host`, `net`, `port`  and  `portrange`
  e.g., `host foo`, `net 128.3`, `port 20`, `portrange 6000-6008`
  If there is no `type` qualifier, `host` is assumed

- `dir` - qualifiers specify a particular transfer direction to and/or from `id`. 
  Possible *directions* are `src`, `dst`, `src or dst`, `src and dst`, `ra`, `ta`, `addr1`, `addr2`, `addr3`, and `addr4`
  e.g., `src foo`, `dst net 128.3`, `src or dst port ftp-data` 
  If there is no `dir` qualifier, `src or dst` is assumed.
  The `ra`, `ta`, `addr1`, `addr2`, `addr3`, and `addr4` qualifiers are only valid for IEEE 802.11 Wireless LAN link layers

- `proto` - qualifiers restrict the match to a particular protocol.  Possible *protos* are: `ether`, `fddi`, `tr`, `wlan`, `ip`, `ip6`, `arp`, `rarp`, `decnet`, `tcp` and `udp`. 
  e.g., `ether src foo`, `arp net 128.3`, `tcp port 21`,  `udp portrange 7000-7009`, `wlan addr2 0:2:3:4:5:6`.  If there is no proto qualifier, all protocols consistent with the type are assumed. 
  e.g. `src foo` means `(ip or arp or rarp) src foo` (except the latter is not legal syntax)
  `net bar` means `(ip or arp or rarp) net bar`
  `port 53` means `(tcp or udp) port 53`

NOT DONE - `man pcap-filter` is a GOLDMINE

