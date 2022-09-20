`sudo nmap -Pn -sS 10.10.42.179`
```
Starting Nmap 7.92 ( https://nmap.org ) at 2022-09-20 18:47 CEST
Nmap scan report for 10.10.42.179
Host is up (0.13s latency).
Not shown: 998 closed tcp ports (reset)
PORT      STATE SERVICE
22/tcp    open  ssh
10000/tcp open  snet-sensor-mgmt

Nmap done: 1 IP address (1 host up) scanned in 2.29 seconds
```

`sudo nmap -Pn -sS -p- 10.10.42.179`