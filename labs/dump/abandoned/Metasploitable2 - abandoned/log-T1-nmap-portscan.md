`sudo nmap -sS -sY -p- 10.0.2.5 | tee log-T1-nmap-portscan.log`
```
Starting Nmap 7.92 ( https://nmap.org ) at 2022-07-12 11:56 EDT
Nmap scan report for 10.0.2.5
Host is up (0.00068s latency).
Not shown: 65376 filtered sctp ports (no-response), 159 filtered sctp ports (proto-unreach), 65505 closed tcp ports (reset)
PORT      STATE SERVICE
21/tcp    open  ftp
22/tcp    open  ssh
23/tcp    open  telnet
25/tcp    open  smtp
53/tcp    open  domain
80/tcp    open  http
111/tcp   open  rpcbind
139/tcp   open  netbios-ssn
445/tcp   open  microsoft-ds
512/tcp   open  exec
513/tcp   open  login
514/tcp   open  shell
1099/tcp  open  rmiregistry
1524/tcp  open  ingreslock
2049/tcp  open  nfs
2121/tcp  open  ccproxy-ftp
3306/tcp  open  mysql
3632/tcp  open  distccd
5432/tcp  open  postgresql
5900/tcp  open  vnc
6000/tcp  open  X11
6667/tcp  open  irc
6697/tcp  open  ircs-u
8009/tcp  open  ajp13
8180/tcp  open  unknown
8787/tcp  open  msgsrvr
44214/tcp open  unknown
44563/tcp open  unknown
58817/tcp open  unknown
60132/tcp open  unknown
MAC Address: 08:00:27:B7:7F:FD (Oracle VirtualBox virtual NIC)

Nmap done: 1 IP address (1 host up) scanned in 160.40 seconds
```

`grep "^[0-9]" log-T1-nmap-portscan.log | awk '{print "T1-"$1 " " $2"}'`
```
T1-21-tcp ftp
T1-22-tcp ssh
T1-23-tcp telnet
T1-25-tcp smtp
T1-53-tcp domain
T1-80-tcp http
T1-111-tcp rpcbind
T1-139-tcp netbios-ssn
T1-445-tcp microsoft-ds
T1-512-tcp exec
T1-513-tcp login
T1-514-tcp shell
T1-1099-tcp rmiregistry
T1-1524-tcp ingreslock
T1-2049-tcp nfs
T1-2121-tcp ccproxy-ftp
T1-3306-tcp mysql
T1-3632-tcp distccd
T1-5432-tcp postgresql
T1-5900-tcp vnc
T1-6000-tcp X11
T1-6667-tcp irc
T1-6697-tcp ircs-u
T1-8009-tcp ajp13
T1-8180-tcp unknown
T1-8787-tcp msgsrvr
T1-44214-tcp unknown
T1-44563-tcp unknown
T1-58817-tcp unknown
T1-60132-tcp unknown
```
for easy port management on [T1 main page](3-T1-10.0.2.5.md)