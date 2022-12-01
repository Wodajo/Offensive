ARP only here, NOT with nmap - proxy ARP might make every target appear up
```
sudo arp-scan 192.168.1.0/24
Interface: eth0, type: EN10MB, MAC: 08:00:27:22:46:4f, IPv4: 192.168.1.105
Starting arp-scan 1.9.8 with 256 hosts (https://github.com/royhills/arp-scan)
192.168.1.1	f0:51:36:1f:17:96	TCT mobile ltd
192.168.1.101	28:f1:0e:21:14:8d	Dell Inc.
192.168.1.107	08:00:27:c1:58:be	PCS Systemtechnik GmbH

3 packets received by filter, 0 packets dropped by kernel
Ending arp-scan 1.9.8: 256 hosts scanned in 2.148 seconds (119.18 hosts/sec). 3 responded
 ```
 
```
sudo nmap --disable-arp-ping -PM -PO -PY -R -sn -iL full_list_of_IPs.txt
Starting Nmap 7.93 ( https://nmap.org ) at 2022-11-27 19:44 EST
Nmap scan report for 192.168.1.1
Host is up (0.00059s latency).
MAC Address: F0:51:36:1F:17:96 (TCT mobile)
Nmap scan report for 192.168.1.101
Host is up (0.00040s latency).
MAC Address: 28:F1:0E:21:14:8D (Dell)
Nmap scan report for 192.168.1.102
Host is up (0.68s latency).
MAC Address: AC:5F:3E:32:A3:BF (Samsung Electro-mechanics(thailand))
Nmap scan report for 192.168.1.107
Host is up (0.00066s latency).
MAC Address: 08:00:27:C1:58:BE (Oracle VirtualBox virtual NIC)
Nmap scan report for 192.168.1.105
Host is up.
Nmap done: 256 IP addresses (5 hosts up) scanned in 43.76 seconds
 ```
 
```
sudo nmap --diasble-arp-ping -PU -sn -iL full_list_of_IPs.txt
Starting Nmap 7.93 ( https://nmap.org ) at 2022-11-27 19:45 EST
Nmap scan report for 192.168.1.1
Host is up (0.0033s latency).
MAC Address: F0:51:36:1F:17:96 (TCT mobile)
Nmap scan report for 192.168.1.102
Host is up (0.45s latency).
MAC Address: AC:5F:3E:32:A3:BF (Samsung Electro-mechanics(thailand))
Nmap scan report for 192.168.1.107
Host is up (0.00064s latency).
MAC Address: 08:00:27:C1:58:BE (Oracle VirtualBox virtual NIC)
Nmap scan report for 192.168.1.105
Host is up.
Nmap done: 256 IP addresses (4 hosts up) scanned in 6.22 seconds
 ```