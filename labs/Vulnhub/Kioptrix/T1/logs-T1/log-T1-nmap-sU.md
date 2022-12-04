```
sudo nmap -Pn -sU 192.168.1.107
Starting Nmap 7.93 ( https://nmap.org ) at 2022-12-03 21:35 EST
Nmap scan report for 192.168.1.107
Host is up (0.00097s latency).
Not shown: 995 closed udp ports (port-unreach)
PORT      STATE         SERVICE
111/udp   open          rpcbind
137/udp   open          netbios-ns
138/udp   open|filtered netbios-dgm
772/udp   open|filtered cycleserv2
32768/udp open          omad
MAC Address: 08:00:27:C1:58:BE (Oracle VirtualBox virtual NIC)

Nmap done: 1 IP address (1 host up) scanned in 1090.01 seconds
```
