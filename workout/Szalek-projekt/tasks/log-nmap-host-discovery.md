`sudo nmap -PM -PO -PY -sn 10.0.2.0/24` 
`-sn` use ICMP echo request, TCP SYN to port 443, TCP ACK to port 80, and an ICMP timestamp, omits further ports scanning.  
`-PM` ICMP netmask, `-PO` IP scan, `-PY` SCTP scan  
That's all default host discovery nmap scans except UDP (slow)
>
Nmap scan report for 10.0.2.1
Host is up (0.00017s latency).
MAC Address: 52:54:00:12:35:00 (QEMU virtual NIC)
Nmap scan report for 10.0.2.2
Host is up (0.0011s latency).
MAC Address: 52:54:00:12:35:00 (QEMU virtual NIC)
Nmap scan report for 10.0.2.3
Host is up (0.00039s latency).
MAC Address: 08:00:27:C3:7F:2F (Oracle VirtualBox virtual NIC)
Nmap scan report for ==10.0.2.15==
Host is up (0.00089s latency).
MAC Address: 08:00:27:02:41:95 (Oracle VirtualBox virtual NIC)
Nmap scan report for 10.0.2.4
Host is up.
Nmap done: 256 IP addresses (5 hosts up) scanned in 27.25 seconds
