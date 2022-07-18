`sudo nmap -PM -PO -PY -sn 10.0.2.0/24` 
`-sn` use ICMP echo request, TCP SYN to port 443, TCP ACK to port 80, and an ICMP timestamp, omits further ports scanning.  
`-PM` ICMP netmask, `-PO` IP scan, `-PY` SCTP scan  
```
Starting Nmap 7.92 ( https://nmap.org ) at 2022-07-12 11:41 EDT
Nmap scan report for 10.0.2.1
Host is up (0.00021s latency).
MAC Address: 52:54:00:12:35:00 (QEMU virtual NIC)
Nmap scan report for 10.0.2.2
Host is up (0.00025s latency).
MAC Address: 52:54:00:12:35:00 (QEMU virtual NIC)
Nmap scan report for 10.0.2.3
Host is up (0.00033s latency).
MAC Address: 08:00:27:56:85:90 (Oracle VirtualBox virtual NIC)
Nmap scan report for 10.0.2.5
Host is up (0.00065s latency).
MAC Address: 08:00:27:B7:7F:FD (Oracle VirtualBox virtual NIC)
Nmap scan report for 10.0.2.4
Host is up.
Nmap scan report for 10.0.2.16
Host is up.
Nmap done: 256 IP addresses (6 hosts up) scanned in 2.44 seconds  
```