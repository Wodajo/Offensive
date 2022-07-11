Can be used on 1 target at time & doesn't support IPv6  

defaultly sending on `port 0`  
(might be better to scan other port - it is not used apart from Unix and is probably surveiled)

### ICMP
`sudo hping3 -1 192.168.1.128 --icmptype 13`  
`-1` ICMP mode, `--icmptype 13` send ICMP type 13 (timestamp request)  

### scan
`sudo hping3 -8 1-1000 -S 192.168.1.128 -V`  
`-8` scan mode, `-S` SYN flag, `V` verbose  
It is common to block incoming SYN packets except for those destined for public services, like the company web site or mail server. When such stateless rules are in place SYN ping won't cut through firewall to other ports than predicted. But ACK flagged segment might.  

`sudo hping -8 1-1000 -A 192.1681.128 -V`  
if unfiltered - `open` and `closed` ports will both return `RST`. That also means that host is alive   
if timeout or ICMP ureachable - filtered. Firewall doesn't allow `ACK` without session - that is stateful firewall)  
Relies mostely on timeouts - slow  

if we've got `RST` we can predict if port is closed or open using it's `Window` and `TTL` fields  
if `Window` field != 0 -> open. Most likely won't work, might work in opposite way.  
if `TTL` < 64 while other packets have higher TTL. As I understand TTL can be governed by Application Control > Custom Service > Policy > System configuration.  
Higher level instances override lower, thus if a port is open packet might have other TTL than the default kernel-configurated ones.  

### simple flooding
`sudo hping3 192.168.1.128 --rand-source --flood`  
flood with packets with no flag set.
`--rand-source` source randomised



