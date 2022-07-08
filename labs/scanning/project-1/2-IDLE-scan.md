kali (attacker)  
win10, M1, Win7 (targets)  

`sudo arp-scan -I eth0 192.168.1.0/24`    
```
Interface: eth0, type: EN10MB, MAC: 08:00:27:50:4c:14, IPv4: 192.168.1.180
Starting arp-scan 1.9.7 with 256 hosts (https://github.com/royhills/arp-scan)
192.168.1.1     92:35:99:60:36:f8       (Unknown: locally administered)
192.168.1.124   08:00:27:ee:9a:b0       PCS Systemtechnik GmbH
192.168.1.128   b8:08:cf:3c:7b:1e       Intel Corporate
192.168.1.145   08:00:27:43:cb:4c       PCS Systemtechnik GmbH
```

#### looking for zombies:  
##### 192.168.1.124 - good zombie
`sudo hping3 -S -A 192.168.1.124 -V`  
sending `SYN` on `port 0`  
```
using eth0, addr: 192.168.1.180, MTU: 1500
HPING 192.168.1.124 (eth0 192.168.1.124): SA set, 40 headers + 0 data bytes
len=46 ip=192.168.1.124 ttl=128 DF id=16919 tos=0 iplen=40
sport=0 flags=R seq=0 win=0 rtt=6.6 ms
seq=329027268 ack=329027268 sum=22db urp=0

len=46 ip=192.168.1.124 ttl=128 DF id=16920 tos=0 iplen=40
sport=0 flags=R seq=1 win=0 rtt=6.7 ms
seq=1576860889 ack=1576860889 sum=366a urp=0

len=46 ip=192.168.1.124 ttl=128 DF id=16921 tos=0 iplen=40
sport=0 flags=R seq=2 win=0 rtt=5.5 ms
seq=1768261460 ack=1768261460 sum=6e3e urp=0
```
has predictably incremental id & respond with `RST` on `SYN/ACK`

##### 192.168.1.128 - bad:<
`sudo hping3 -S -A 192.168.1.128 -V`
```
using eth0, addr: 192.168.1.180, MTU: 1500
HPING 192.168.1.128 (eth0 192.168.1.128): SA set, 40 headers + 0 data bytes
^C
--- 192.168.1.128 hping statistic ---
5 packets transmitted, 0 packets received, 100% packet loss
```
`SYN/ACK` packets on `port 0` dropped (no `RST` response) -> bad zombie
(under `port 0` there is no processes and we want to see how kernel reacts. If kernel reacts nicely and zombie's port 80 is not responding you can alwas change zombie "source" port)  
Idle scan is using src. port 80

`sudo hping3 -S -p 445 192.168.1.128 -V`
```
using eth0, addr: 192.168.1.180, MTU: 1500
HPING 192.168.1.128 (eth0 192.168.1.128): S set, 40 headers + 0 data bytes
len=46 ip=192.168.1.128 ttl=128 DF id=15015 tos=0 iplen=44
sport=445 flags=SA seq=0 win=65392 rtt=11.4 ms
seq=1685672036 ack=844043732 sum=850a urp=0

len=46 ip=192.168.1.128 ttl=128 DF id=15016 tos=0 iplen=44
sport=445 flags=SA seq=1 win=65392 rtt=3.3 ms
seq=177905069 ack=316642709 sum=c8b6 urp=0
```
incremental id  (BUT still bad zombie - drops instead `SA`->`R`)

##### 192.168.1.145 - bad
`sudo hping3 -S -A 192.168.1.145 -V`  
```
using eth0, addr: 192.168.1.180, MTU: 1500
HPING 192.168.1.145 (eth0 192.168.1.145): SA set, 40 headers + 0 data bytes
^C
--- 192.168.1.145 hping statistic ---
4 packets transmitted, 0 packets received, 100% packet loss
```
bad zombie (not responding to `SYN/ACK`)  

##### 192.168.1.1 - bad
`sudo hping3 -S -A 192.168.1.1 -V`  
```
using eth0, addr: 192.168.1.180, MTU: 1500
HPING 192.168.1.1 (eth0 192.168.1.1): SA set, 40 headers + 0 data bytes
len=46 ip=192.168.1.1 ttl=64 DF id=32096 tos=0 iplen=40
sport=0 flags=R seq=0 win=0 rtt=75.1 ms
seq=1629916109 ack=0 sum=7436 urp=0

len=46 ip=192.168.1.1 ttl=64 DF id=32183 tos=0 iplen=40
sport=0 flags=R seq=1 win=0 rtt=2.9 ms
seq=1193803797 ack=0 sum=29dc urp=0

^C
--- 192.168.1.1 hping statistic ---
2 packets transmitted, 2 packets received, 0% packet loss
```
bad zombie (not simply predictable IP ID)

### idle scan
zombie - `192.168.1.124`
Idle scan is using src. port 80 by default. Here passed only as a remainder that you could decide what is "source" zombie port

`sudo nmap -Pn -p- -sI 192.168.1.124:80 192.168.1.145`  
```
Starting Nmap 7.92 ( https://nmap.org ) at 2022-07-07 17:59 EDT
Idle scan using zombie 192.168.1.124 (192.168.1.124:80); Class: Incremental
Nmap scan report for DESKTOP-LF98FO2 (192.168.1.145)
Host is up (0.025s latency).
Not shown: 65534 closed|filtered tcp ports (no-ipid-change)
PORT     STATE SERVICE
7680/tcp open  pando-pub
MAC Address: 08:00:27:43:CB:4C (Oracle VirtualBox virtual NIC)

Nmap done: 1 IP address (1 host up) scanned in 601.53 seconds
```

`sudo nmap -Pn -p- -sI 192.168.1.124:80 192.168.1.128`
```
Starting Nmap 7.92 ( https://nmap.org ) at 2022-07-08 12:57 EDT
Idle scan using zombie 192.168.1.124 (192.168.1.124:80); Class: Incremental
Nmap scan report for Neocortex (192.168.1.128)
Host is up (0.051s latency).
Not shown: 65529 closed|filtered tcp ports (no-ipid-change)
PORT      STATE SERVICE
135/tcp   open  msrpc
139/tcp   open  netbios-ssn
445/tcp   open  microsoft-ds
5357/tcp  open  wsdapi
7680/tcp  open  pando-pub
49668/tcp open  unknown
MAC Address: B8:08:CF:3C:7B:1E (Intel Corporate)
```

results are the same as `sudo nmap -sS -p- <target IP>` ^^