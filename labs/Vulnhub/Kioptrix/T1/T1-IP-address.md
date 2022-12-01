IP: 192.168.1.107
MAC: 08:00:27:C1:58:BE
OS: 

extracted usefull info (like creds)
****
users list

[22/tcp](./log-T1-tcp-22)    open  OpenSSH 2.9p2 (protocol 1.99)
[80/tcp](./log-T1-tcp-80)    open  Apache httpd 1.3.20 ((Unix)  (Red-Hat/Linux) mod_ssl/2.8.4 OpenSSL/0.9.6b)
[111/tcp&udp](./log-T1-111)   open  rpcbind     2 (RPC #100000)
[139/tcp](./log-T1-tcp-139)   open  netbios-ssn Samba smbd (workgroup: CgMYGROUP)
443/tcp   open  https
32768/tcp open  filenet-tms

137/udp   open          netbios-ns
138/udp   open|filtered netbios-dgm
32768/udp open          omad

commands list for T1 (chronologically)
e.g.
[log-initial_scan](./log-initial_scan)
[log-T1-nmap-A](./log-T1-nmap-A)
log-T1-

Notes: