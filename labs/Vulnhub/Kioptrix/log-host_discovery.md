proxy ARP might make every target appear up -> ARP only with arp-scan, NOT with nmap
```
sudo arp-scan 192.168.1.0/24
Interface: eth0, type: EN10MB, MAC: 08:00:27:22:46:4f, IPv4: 192.168.1.105
Starting arp-scan 1.9.8 with 256 hosts (https://github.com/royhills/arp-scan)
192.168.1.1	f0:51:36:1f:17:96	TCT mobile ltd
192.168.1.101	28:f1:0e:21:14:8d	Dell Inc.
192.168.1.107	08:00:27:c1:58:be	PCS Systemtechnik GmbH

8 packets received by filter, 0 packets dropped by kernel
Ending arp-scan 1.9.8: 256 hosts scanned in 2.203 seconds (116.21 hosts/sec). 3 responded
```

```
sudo nmap --disable-arp-ping -PM -PO -PY -R -sn -iL full_list_of_IPs.txt
Starting Nmap 7.93 ( https://nmap.org ) at 2022-12-03 21:33 EST
Nmap scan report for 192.168.1.1
Host is up (0.0043s latency).
MAC Address: F0:51:36:1F:17:96 (TCT mobile)
Nmap scan report for 192.168.1.101
Host is up (0.00076s latency).
MAC Address: 28:F1:0E:21:14:8D (Dell)
Nmap scan report for 192.168.1.107
Host is up (0.0015s latency).
MAC Address: 08:00:27:C1:58:BE (Oracle VirtualBox virtual NIC)
Nmap scan report for 192.168.1.105
Host is up.
Nmap done: 256 IP addresses (4 hosts up) scanned in 27.12 seconds
```

```
sudo nmap --disable-arp-ping -PU -sn -iL full_list_of_IPs.txt
Starting Nmap 7.93 ( https://nmap.org ) at 2022-12-03 21:33 EST
Nmap scan report for 192.168.1.1
Host is up (0.0017s latency).
MAC Address: F0:51:36:1F:17:96 (TCT mobile)
Nmap scan report for 192.168.1.105
Host is up.
Nmap done: 256 IP addresses (2 hosts up) scanned in 4.90 seconds
```

