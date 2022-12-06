```
sudo nmap -Pn -sU -pU:111,137,138,32768 -A 192.168.1.107
Starting Nmap 7.93 ( https://nmap.org ) at 2022-12-06 16:26 EST
Nmap scan report for 192.168.1.107
Host is up (0.00051s latency).

PORT      STATE         SERVICE     VERSION
111/udp   open          rpcbind     2 (RPC #100000)
| rpcinfo: 
|   program version    port/proto  service
|   100000  2            111/tcp   rpcbind
|   100000  2            111/udp   rpcbind
|   100024  1          32768/tcp   status
|_  100024  1          32768/udp   status
137/udp   open          netbios-ns  Samba nmbd netbios-ns (workgroup: MYGROUP)
| nbns-interfaces: 
|   hostname: KIOPTRIX
|   interfaces: 
|_    192.168.1.107
138/udp   open|filtered netbios-dgm
32768/udp open          status      1 (RPC #100024)
MAC Address: 08:00:27:C1:58:BE (Oracle VirtualBox virtual NIC)
Too many fingerprints match this host to give specific OS details
Network Distance: 1 hop
Service Info: Host: KIOPTRIX

Host script results:
|_nbstat: NetBIOS name: KIOPTRIX, NetBIOS user: <unknown>, NetBIOS MAC: 000000000000 (Xerox)

TRACEROUTE
HOP RTT     ADDRESS
1   0.51 ms 192.168.1.107

OS and Service detection performed. Please report any incorrect results at https://nmap.org/submit/ .
Nmap done: 1 IP address (1 host up) scanned in 116.10 seconds
```
