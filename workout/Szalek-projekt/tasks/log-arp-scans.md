`sudo arp-scan -I eth0 10.0.2.0/24`

```
Interface: eth0, type: EN10MB, MAC: 08:00:27:50:4c:14, IPv4: 10.0.2.4
Starting arp-scan 1.9.7 with 256 hosts (https://github.com/royhills/arp-scan)
10.0.2.1        52:54:00:12:35:00       QEMU
10.0.2.2        52:54:00:12:35:00       QEMU
10.0.2.3        08:00:27:c3:7f:2f       PCS Systemtechnik GmbH
10.0.2.15       08:00:27:02:41:95       PCS Systemtechnik GmbH

4 packets received by filter, 0 packets dropped by kernel
Ending arp-scan 1.9.7: 256 hosts scanned in 2.232 seconds (114.70 hosts/sec). 4 responded
```



`sudo nmap -PR -sn 10.0.2.15`   
to samo co wyzej tylko w nmapie (brzydszy output ALE jest timestamp)  

```
Starting Nmap 7.92 ( https://nmap.org ) at 2022-06-25 20:14 EDT
Nmap scan report for 10.0.2.1
Host is up (0.00025s latency).
MAC Address: 52:54:00:12:35:00 (QEMU virtual NIC)
Nmap scan report for 10.0.2.2
Host is up (0.00020s latency).
MAC Address: 52:54:00:12:35:00 (QEMU virtual NIC)
Nmap scan report for 10.0.2.3
Host is up (0.00032s latency).
MAC Address: 08:00:27:C3:7F:2F (Oracle VirtualBox virtual NIC)
Nmap scan report for 10.0.2.15
Host is up (0.00069s latency).
MAC Address: 08:00:27:02:41:95 (Oracle VirtualBox virtual NIC)
Nmap scan report for 10.0.2.4
Host is up.
Nmap done: 256 IP addresses (5 hosts up) scanned in 2.22 seconds
```

`sudo arp-scan -l`  2022-06-27 22:44
```
10.0.2.1        52:54:00:12:35:00       QEMU
10.0.2.2        52:54:00:12:35:00       QEMU
10.0.2.3        08:00:27:07:dc:51       PCS Systemtechnik GmbH
10.0.2.13       08:00:27:02:41:95       PCS Systemtechnik GmbH
```