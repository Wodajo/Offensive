22/tcp    open  ssh
80/tcp    open  http
111/tcp   open  rpcbind
139/tcp   open  netbios-ssn
443/tcp   open  https
32768/tcp open  filenet-tms

111/udp   open          rpcbind
137/udp   open          netbios-ns
138/udp   open|filtered netbios-dgm
32768/udp open          omad

1        open   icmp
6        open   tcp
17       open   udp
132      closed sctp
****

typical for ICMP echo reply ttl IP header field: 64 linux (some kernels 255), 128 windows, 255 solaris&networking dev.


ttl=255
ttl=255

```
sudo nmap -Pn -p- -sS 192.168.1.107 
Starting Nmap 7.93 ( https://nmap.org ) at 2022-11-27 06:42 EST
Nmap scan report for 192.168.1.107
Host is up (0.00029s latency).
Not shown: 65529 closed tcp ports (reset)
PORT      STATE SERVICE
22/tcp    open  ssh
80/tcp    open  http
111/tcp   open  rpcbind
139/tcp   open  netbios-ssn
443/tcp   open  https
32768/tcp open  filenet-tms
MAC Address: 08:00:27:C1:58:BE (Oracle VirtualBox virtual NIC)

Nmap done: 1 IP address (1 host up) scanned in 5.44 seconds
 ```

```
sudo nmap -Pn -p- -sY 192.168.1.107
Starting Nmap 7.93 ( https://nmap.org ) at 2022-11-27 06:42 EST
Nmap scan report for 192.168.1.107
Host is up (0.00052s latency).
All 65535 scanned ports on 192.168.1.107 are in ignored states.
Not shown: 65372 filtered sctp ports (no-response), 163 filtered sctp ports (proto-unreach)
MAC Address: 08:00:27:C1:58:BE (Oracle VirtualBox virtual NIC)

Nmap done: 1 IP address (1 host up) scanned in 157.36 seconds
 ```


```
sudo nmap -Pn -p- -sO 192.168.1.107
Starting Nmap 7.93 ( https://nmap.org ) at 2022-11-27 06:45 EST
Nmap scan report for 192.168.1.107
Host is up (0.00028s latency).
Not shown: 252 open|filtered n/a protocols (no-response)
PROTOCOL STATE  SERVICE
1        open   icmp
6        open   tcp
17       open   udp
132      closed sctp
MAC Address: 08:00:27:C1:58:BE (Oracle VirtualBox virtual NIC)

Nmap done: 1 IP address (1 host up) scanned in 2.81 seconds
 ```


```
sudo nmap -Pn -sU 192.168.1.107
Starting Nmap 7.93 ( https://nmap.org ) at 2022-11-27 06:45 EST
Nmap scan report for 192.168.1.107
Host is up (0.00059s latency).
Not shown: 996 closed udp ports (port-unreach)
PORT      STATE         SERVICE
111/udp   open          rpcbind
137/udp   open          netbios-ns
138/udp   open|filtered netbios-dgm
32768/udp open          omad
MAC Address: 08:00:27:C1:58:BE (Oracle VirtualBox virtual NIC)

Nmap done: 1 IP address (1 host up) scanned in 1091.22 seconds
 ```