#### root enumeration
`gobuster dir --url 10.0.2.13 -w /usr/share/wordlists/dirbuster/directory-list-2.3-medium.txt -o gobuster.md`
```
===============================================================
[+] Url:                     http://10.0.2.13
[+] Method:                  GET
[+] Threads:                 10
[+] Wordlist:                /usr/share/wordlists/dirbuster/directory-list-2.3-medium.txt
[+] Negative Status codes:   404
[+] User Agent:              gobuster/3.1.0
[+] Timeout:                 10s
===============================================================
2022/06/28 07:36:14 Starting gobuster in directory enumeration mode
===============================================================
/index                (Status: 200) [Size: 45]
/twiki                (Status: 301) [Size: 346] [--> http://10.0.2.13/twiki/]
/tikiwiki             (Status: 301) [Size: 349] [--> http://10.0.2.13/tikiwiki/]
/phpinfo              (Status: 200) [Size: 47442]                               
/server-status        (Status: 403) [Size: 330]                                 
                                                                                
===============================================================
2022/06/28 07:37:12 Finished
```
#### twiki/ enumeration
`gobuster dir --url 10.0.2.13:80/twiki/ -w /usr/share/wordlists/dirbuster/directory-list-2.3-medium.txt`
```
===============================================================
[+] Url:                     http://10.0.2.13:80/twiki/
[+] Method:                  GET
[+] Threads:                 10
[+] Wordlist:                /usr/share/wordlists/dirbuster/directory-list-2.3-medium.txt
[+] Negative Status codes:   404
[+] User Agent:              gobuster/3.1.0
[+] Timeout:                 10s
===============================================================
2022/06/28 07:42:54 Starting gobuster in directory enumeration mode
===============================================================
/index                (Status: 200) [Size: 782]
/templates            (Status: 403) [Size: 332]
/pub                  (Status: 301) [Size: 350] [--> http://10.0.2.13/twiki/pub/]
/data                 (Status: 403) [Size: 327]                                  
/bin                  (Status: 301) [Size: 350] [--> http://10.0.2.13/twiki/bin/]
/license              (Status: 200) [Size: 19440]                                
/lib                  (Status: 301) [Size: 350] [--> http://10.0.2.13/twiki/lib/]
/readme               (Status: 200) [Size: 4334]                                 
/TWikiHistory         (Status: 200) [Size: 52417]                                
                                                                                 
===============================================================
2022/06/28 07:43:58 Finished
```
NOT DONE YET - find a way to enumerate also subsites