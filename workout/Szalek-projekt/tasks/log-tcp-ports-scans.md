`sudo nmap -Pn -sS -p- 10.0.2.15`
>
Nmap scan report for 10.0.2.15
Host is up (0.00025s latency).
Not shown: 65523 closed tcp ports (reset)
PORT     STATE SERVICE
21/tcp   open  ftp
22/tcp   open  ssh
23/tcp   open  telnet
25/tcp   open  smtp
53/tcp   open  domain
80/tcp   open  http
139/tcp  open  netbios-ssn
445/tcp  open  microsoft-ds
3306/tcp open  mysql
3632/tcp open  distccd
5432/tcp open  postgresql
8180/tcp open  unknown
MAC Address: 08:00:27:02:41:95 (Oracle VirtualBox virtual NIC)
>
Nmap done: 1 IP address (1 host up) scanned in 5.16 seconds

`sudo nmap -Pn -sS -p- 10.0.2.15 | tee port.scan.txt | grep ^[0-9] | awk '{print "[["$1"]] " $3}' | sed "s_/_-_g" | tee port.scan.md` 
for easier notes management sake
>
[[21-tcp]] ftp
[[22-tcp]] ssh
[[23-tcp]] telnet
[[25-tcp]] smtp
[[53-tcp]] domain
[[80-tcp]] http
[[139-tcp]] netbios-ssn
[[445-tcp]] microsoft-ds
[[3306-tcp]] mysql
[[3632-tcp]] distccd
[[5432-tcp]] postgresql
[[8180-tcp]] unknown
