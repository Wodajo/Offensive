proxy ARP might make every target appear up -> ARP only with arp-scan, NOT with nmap
```
sudo arp-scan 192.168.1.0/24
Interface: eth0, type: EN10MB, MAC: 08:00:27:22:46:4f, IPv4: 192.168.1.105
Starting arp-scan 1.9.8 with 256 hosts (https://github.com/royhills/arp-scan)
192.168.1.1	f0:51:36:1f:17:96	TCT mobile ltd
192.168.1.101	28:f1:0e:21:14:8d	Dell Inc.
192.168.1.107	08:00:27:c1:58:be	PCS Systemtechnik GmbH

3 packets received by filter, 0 packets dropped by kernel
Ending arp-scan 1.9.8: 256 hosts scanned in 2.274 seconds (112.58 hosts/sec). 3 responded
```

```
sudo nmap --disable-arp-ping -PM -PO -PY -R -sn -iL full_list_of_IPs.txt
Starting Nmap 7.93 ( https://nmap.org ) at 2022-12-06 16:03 EST
Nmap scan report for 192.168.1.1
Host is up (0.00060s latency).
MAC Address: F0:51:36:1F:17:96 (TCT mobile)
Nmap scan report for 192.168.1.101
Host is up (0.00026s latency).
MAC Address: 28:F1:0E:21:14:8D (Dell)
Nmap scan report for 192.168.1.102
Host is up (0.76s latency).
MAC Address: AC:5F:3E:32:A3:BF (Samsung Electro-mechanics(thailand))
Nmap scan report for 192.168.1.107
Host is up (0.0010s latency).
MAC Address: 08:00:27:C1:58:BE (Oracle VirtualBox virtual NIC)
Nmap scan report for 192.168.1.105
Host is up.
Nmap done: 256 IP addresses (5 hosts up) scanned in 48.77 seconds
```

```
sudo nmap --disable-arp-ping -PU -sn -iL full_list_of_IPs.txt
Starting Nmap 7.93 ( https://nmap.org ) at 2022-12-06 16:03 EST
Nmap scan report for 192.168.1.1
Host is up (0.0011s latency).
MAC Address: F0:51:36:1F:17:96 (TCT mobile)
Nmap scan report for 192.168.1.102
Host is up (0.76s latency).
MAC Address: AC:5F:3E:32:A3:BF (Samsung Electro-mechanics(thailand))
Nmap scan report for 192.168.1.107
Host is up (0.00047s latency).
MAC Address: 08:00:27:C1:58:BE (Oracle VirtualBox virtual NIC)
Nmap scan report for 192.168.1.105
Host is up.
Nmap done: 256 IP addresses (4 hosts up) scanned in 7.11 seconds
```

