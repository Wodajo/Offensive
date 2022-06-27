`sudo nmap -p80 -Pn --script "http-*" 10.0.2.15` 
too long for now

`sudo gobuster dir --url 10.0.2.15 -w /usr/share/wordlists/dirbuster/directory-list-2.3-medium.txt -o gobuster.md`
```
[+] Url:                     http://10.0.2.15
[+] Method:                  GET
[+] Threads:                 10
[+] Wordlist:                /usr/share/wordlists/dirbuster/directory-list-2.3-medium.txt
[+] Negative Status codes:   404
[+] User Agent:              gobuster/3.1.0
[+] Timeout:                 10s
===============================================================
2022/06/25 07:27:22 Starting gobuster in directory enumeration mode
===============================================================
/index                (Status: 200) [Size: 45]
/twiki                (Status: 301) [Size: 346] [--> http://10.0.2.15/twiki/]
/tikiwiki             (Status: 301) [Size: 349] [--> http://10.0.2.15/tikiwiki/]
/phpinfo              (Status: 200) [Size: 47442]                               
/server-status        (Status: 403) [Size: 330]
```

`sudo nmap -p80 -Pn -n --script=http-title 10.0.2.15` 
```
80/tcp open  http
|_http-title: Site doesn't have a title (text/html)
```

