kali (attacker)
win10, M1, Win7 (targets)

`sudo arp-scan -l`  
```
Interface: eth0, type: EN10MB, MAC: 08:00:27:50:4c:14, IPv4: 192.168.1.180
Starting arp-scan 1.9.7 with 256 hosts (https://github.com/royhills/arp-scan)
192.168.1.1     92:35:99:60:36:f8       (Unknown: locally administered)
192.168.1.124   08:00:27:ee:9a:b0       PCS Systemtechnik GmbH
192.168.1.128   b8:08:cf:3c:7b:1e       Intel Corporate
192.168.1.145   08:00:27:43:cb:4c       PCS Systemtechnik GmbH
```

looking for zombie:
`sudo hping3 -S 192.168.1.124 -V`
sending SYN on port 0
```
using eth0, addr: 192.168.1.180, MTU: 1500
HPING 192.168.1.124 (eth0 192.168.1.124): S set, 40 headers + 0 data bytes
len=46 ip=192.168.1.124 ttl=128 DF id=2457 tos=0 iplen=40
sport=0 flags=RA seq=0 win=0 rtt=11.9 ms
seq=0 ack=48720744 sum=5b8 urp=0

len=46 ip=192.168.1.124 ttl=128 DF id=2458 tos=0 iplen=40
sport=0 flags=RA seq=1 win=0 rtt=8.6 ms
seq=0 ack=1240559860 sum=6e6b urp=0

len=46 ip=192.168.1.124 ttl=128 DF id=2459 tos=0 iplen=40
sport=0 flags=RA seq=2 win=0 rtt=7.0 ms
seq=0 ack=644698136 sum=cdaf urp=0

len=46 ip=192.168.1.124 ttl=128 DF id=2460 tos=0 iplen=40
sport=0 flags=RA seq=3 win=0 rtt=2.1 ms
seq=0 ack=1695684526 sum=91a9 urp=0
```
has predictably incremental id :D

Let's idle scan `192.168.1.145`
`sudo nmap -Pn -p- -sI 192.168.1.124 192.168.1.145`