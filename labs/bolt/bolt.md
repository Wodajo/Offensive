`sudo nmap -p T:22,80,8000 -sV 10.10.245.195`
```
Starting Nmap 7.92 ( https://nmap.org ) at 2022-09-03 13:30 CEST
Nmap scan report for 10.10.245.195
Host is up (0.10s latency).

PORT     STATE SERVICE VERSION
22/tcp   open  ssh     OpenSSH 7.6p1 Ubuntu 4ubuntu0.3 (Ubuntu Linux; protocol 2.0)
80/tcp   open  http    Apache httpd 2.4.29 ((Ubuntu))
8000/tcp open  http    (PHP 7.2.32-1)
```

`sudo nmap -p T:22,80,8000 -sC 10.10.245.195`
```
PORT     STATE SERVICE
22/tcp   open  ssh
| ssh-hostkey:
|   2048 f3:85:ec:54:f2:01:b1:94:40:de:42:e8:21:97:20:80 (RSA)
|   256 77:c7:c1:ae:31:41:21:e4:93:0e:9a:dd:0b:29:e1:ff (ECDSA)
|_  256 07:05:43:46:9d:b2:3e:f0:4d:69:67:e4:91:d3:d3:7f (ED25519)
80/tcp   open  http
|_http-title: Apache2 Ubuntu Default Page: It works
8000/tcp open  http-alt
|_http-generator: Bolt
|_http-title: Bolt | A hero is unleashed
|_http-open-proxy: Proxy might be redirecting requests
```

