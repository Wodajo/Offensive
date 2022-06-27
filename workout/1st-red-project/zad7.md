`sudo arp-scan -I eth0 10.0.2.0/24`
```
Interface: eth0, type: EN10MB, MAC: 08:00:27:50:4c:14, IPv4: 10.0.2.4
Starting arp-scan 1.9.7 with 256 hosts (https://github.com/royhills/arp-scan)
10.0.2.1        52:54:00:12:35:00       QEMU
10.0.2.2        52:54:00:12:35:00       QEMU
10.0.2.3        08:00:27:07:dc:51       PCS Systemtechnik GmbH
10.0.2.14       08:00:27:ee:9a:b0       PCS Systemtechnik GmbH

4 packets received by filter, 0 packets dropped by kernel
Ending arp-scan 1.9.7: 256 hosts scanned in 2.216 seconds (115.52 hosts/sec). 4 responded
```

`sudo nmap -Pn -sS -p- 10.0.2.14`
```
Starting Nmap 7.92 ( https://nmap.org ) at 2022-06-27 15:51 EDT
Nmap scan report for 10.0.2.14
Host is up (0.0011s latency).
Not shown: 65526 closed tcp ports (reset)
PORT      STATE SERVICE
135/tcp   open  msrpc
139/tcp   open  netbios-ssn
445/tcp   open  microsoft-ds
49152/tcp open  unknown
49153/tcp open  unknown
49154/tcp open  unknown
49155/tcp open  unknown
49156/tcp open  unknown
49157/tcp open  unknown
MAC Address: 08:00:27:EE:9A:B0 (Oracle VirtualBox virtual NIC)
```

`sudo nmap -Pn -sV -sC -p135,139,445,49152,49153,49154,49155,49156,49157 10.0.2.14`
