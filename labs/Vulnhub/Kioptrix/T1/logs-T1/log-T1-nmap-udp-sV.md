```
sudo nmap -Pn -sU -pU:111,137,138,32768,772 -sV 192.168.1.107
Starting Nmap 7.93 ( https://nmap.org ) at 2022-12-03 21:53 EST
Nmap scan report for 192.168.1.107
Host is up (0.00086s latency).

PORT      STATE         SERVICE     VERSION
111/udp   open          rpcbind     2 (RPC #100000)
137/udp   open          netbios-ns  Samba nmbd netbios-ns (workgroup: MYGROUP)
138/udp   open|filtered netbios-dgm
772/udp   open|filtered cycleserv2
32768/udp open          status      1 (RPC #100024)
MAC Address: 08:00:27:C1:58:BE (Oracle VirtualBox virtual NIC)
Service Info: Host: KIOPTRIX

Service detection performed. Please report any incorrect results at https://nmap.org/submit/ .
Nmap done: 1 IP address (1 host up) scanned in 101.33 seconds
```
