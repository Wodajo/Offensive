# Host discovery

- I want to find my IP address
`ip a`
```
1: lo: <LOOPBACK,UP,LOWER_UP> mtu 65536 qdisc noqueue state UNKNOWN group default qlen 1000
    link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
    inet 127.0.0.1/8 scope host lo
       valid_lft forever preferred_lft forever
    inet6 ::1/128 scope host 
       valid_lft forever preferred_lft forever
2: eth0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc fq_codel state UP group default qlen 1000
    link/ether 08:00:27:50:4c:14 brd ff:ff:ff:ff:ff:ff
    inet **10.0.2.4/24** brd 10.0.2.255 scope global dynamic noprefixroute eth0
       valid_lft 357sec preferred_lft 357sec
    inet6 fe80::a00:27ff:fe50:4c14/64 scope link noprefixroute 
       valid_lft forever preferred_lft forever
```
My IP: 10.0.2.4

- I want to see how this subnet is build  
`route` display kernel routing table (**HOW IT IS ESTABLISHED???**)  
```
Kernel IP routing table
Destination     Gateway         Genmask         Flags Metric Ref    Use Iface
default         10.0.2.1        0.0.0.0         UG    100    0        0 eth0
10.0.2.0        0.0.0.0         255.255.255.0   U     100    0        0 eth0
```
Network ID: `10.0.2.0/24`  
Router IP: `10.0.2.1`  
flag `U` means that IP route is up  

- ARP scans (multiple for memorising sake - all results the same)  
`sudo arp-scan -I eth0 10.0.2.0/24`  
```
Interface: eth0, type: EN10MB, MAC: 08:00:27:50:4c:14, IPv4: 10.0.2.4
Starting arp-scan 1.9.7 with 256 hosts (https://github.com/royhills/arp-scan)
10.0.2.1        52:54:00:12:35:00       QEMU
10.0.2.2        52:54:00:12:35:00       QEMU
10.0.2.3        08:00:27:c3:7f:2f       PCS Systemtechnik GmbH
10.0.2.5        08:00:27:b7:7f:fd       PCS Systemtechnik GmbH
10.0.2.7        08:00:27:99:23:1a       PCS Systemtechnik GmbH
10.0.2.10       08:00:27:7a:13:da       PCS Systemtechnik GmbH
10.0.2.11       08:00:27:1d:b7:81       PCS Systemtechnik GmbH
10.0.2.15       08:00:27:ed:f5:f1       PCS Systemtechnik GmbH
```
`10.0.2.2` is probably DHCP (check UDP ports 67 and 68)
Potential targets: `10.0.2.3`, `10.0.2.5`, `10.0.2.7`, `10.0.2.10`, `10.0.2.11`, `10.0.2.15`  
(After second try `10.0.2.11` disappeared!)  
`sudo netdiscover -r 10.0.2.0/24` -r range (not autoscan)  
```
 _____________________________________________________________________________
   IP            At MAC Address     Count     Len  MAC Vendor / Hostname      
 -----------------------------------------------------------------------------
 10.0.2.1        52:54:00:12:35:00      1      60  Unknown vendor                                                 
 10.0.2.2        52:54:00:12:35:00      1      60  Unknown vendor                                                 
 10.0.2.3        08:00:27:c3:7f:2f      1      60  PCS Systemtechnik GmbH                                         
 10.0.2.5        08:00:27:b7:7f:fd      1      60  PCS Systemtechnik GmbH                                         
 10.0.2.7        08:00:27:99:23:1a      1      60  PCS Systemtechnik GmbH                                         
 10.0.2.10       08:00:27:7a:13:da      1      60  PCS Systemtechnik GmbH                                         
 10.0.2.15       08:00:27:ed:f5:f1      1      60  PCS Systemtechnik GmbH
 ```
  `sudo nmap -sn -PR 10.0.2.0/24` -sn no port scanning, -PR ARP scan  
 ```
 Nmap scan report for 10.0.2.1
Host is up (0.00026s latency).
MAC Address: 52:54:00:12:35:00 (QEMU virtual NIC)
Nmap scan report for 10.0.2.2
Host is up (0.00023s latency).
MAC Address: 52:54:00:12:35:00 (QEMU virtual NIC)
Nmap scan report for 10.0.2.3
Host is up (0.00043s latency).
MAC Address: 08:00:27:C3:7F:2F (Oracle VirtualBox virtual NIC)
Nmap scan report for 10.0.2.5
Host is up (0.00066s latency).
MAC Address: 08:00:27:B7:7F:FD (Oracle VirtualBox virtual NIC)
Nmap scan report for 10.0.2.7
Host is up (0.00095s latency).
MAC Address: 08:00:27:99:23:1A (Oracle VirtualBox virtual NIC)
Nmap scan report for 10.0.2.10
Host is up (0.0011s latency).
MAC Address: 08:00:27:7A:13:DA (Oracle VirtualBox virtual NIC)
Nmap scan report for 10.0.2.15
Host is up (0.00060s latency).
MAC Address: 08:00:27:ED:F5:F1 (Oracle VirtualBox virtual NIC)
Nmap scan report for 10.0.2.4
Host is up.
Nmap done: 256 IP addresses (8 hosts up) scanned in 3.01 seconds
```

