john access
user.txt flag

****
`chmod 600 id_rsa_bruteit`

`ssh john@10.10.36.191 -i id_rsa_bruteit`
```
Welcome to Ubuntu 18.04.4 LTS (GNU/Linux 4.15.0-118-generic x86_64)

 * Documentation:  https://help.ubuntu.com
 * Management:     https://landscape.canonical.com
 * Support:        https://ubuntu.com/advantage

  System information as of Sat Sep 24 09:35:25 UTC 2022

  System load:  0.09               Processes:           101
  Usage of /:   25.7% of 19.56GB   Users logged in:     0
  Memory usage: 20%                IP address for eth0: 10.10.36.191
  Swap usage:   0%


63 packages can be updated.
0 updates are security updates.


Last login: Sat Sep 24 09:34:47 2022 from 10.14.28.233
john@bruteit:~$ ls
user.txt
john@bruteit:~$ cat user.txt
```

-> user.txt