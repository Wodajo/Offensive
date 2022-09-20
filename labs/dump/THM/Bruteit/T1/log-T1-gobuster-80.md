`gobuster dir -u 10.10.13.234 -w /usr/share/wordlists/dirb/common.txt -o output_gobuster -q`
```
/.htpasswd            (Status: 403) [Size: 277]
/.hta                 (Status: 403) [Size: 277]
/.htaccess            (Status: 403) [Size: 277]
/admin                (Status: 301) [Size: 312] [--> http://10.10.13.234/admin/]
/index.html           (Status: 200) [Size: 10918]                  
/server-status        (Status: 403) [Size: 277]
```