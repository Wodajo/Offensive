Lab - kali VM (attacker), win10 (target). On win10 - wireshark

`sudo arp-scan -I eth0 192.168.1.0/24`
```
Interface: eth0, type: EN10MB, MAC: 08:00:27:50:4c:14, IPv4: 192.168.1.180
Starting arp-scan 1.9.7 with 256 hosts (https://github.com/royhills/arp-scan)
192.168.1.1     92:35:99:60:36:f8       (Unknown: locally administered)
192.168.1.128   b8:08:cf:3c:7b:1e       Intel Corporate
192.168.1.107   2c:0e:3d:7f:34:5d       SAMSUNG ELECTRO-MECHANICS(THAILAND)

3 packets received by filter, 0 packets dropped by kernel
```
Target: `192.168.1.128`

`sudo hping3 -8 1-65535 -S 192.168.1.128`  
`-8` scan mode, `-S` SYN flag
```
Scanning 192.168.1.128 (192.168.1.128), port 1-65535
65535 ports to scan, use -V to see all the replies
+----+-----------+---------+---+-----+-----+-----+
|port| serv name |  flags  |ttl| id  | win | len |
+----+-----------+---------+---+-----+-----+-----+
  135 epmap      : .S..A... 128 21563 65392    46
  139 netbios-ssn: .S..A... 128 21819  8192    46
  445 microsoft-d: .S..A... 128 22075 65392    46
 5357            : .S..A... 128 22331 65392    46
 7680            : .S..A... 128 22587 65392    46
49668            : .S..A... 128 22843 65392    46
```
TTL <= 128 -> Windows

`sudo hping3 -2 --rand-source --data 500 192.168.1.128`
crafts and sends UPD datagrams  
`--rand-source` source randomised
`--data 500`  500 bytes of data in datagram