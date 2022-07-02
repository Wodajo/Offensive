- How during arp spoofed sniffing target is allowed to browse web? (kernel forwarding is not active). Shouldn't packet's arrive at attacker's machine and be dropped?  
- some ideas about why scans outputs are so different? (ettercap seems to have probles arp scanning, wierd results with scanning smartphones)  
- problem with executing ncrack attack on telnet  
`sudo ncrack -U /usr/share/wordlists/seclists/Usernames/cirt-default-usernames.txt -P /usr/share/wordlists/seclists/Usernames/cirt-default-usernames.txt 10.0.2.13 -p 23`  
what's wrong? :< I thought telnet enumeration would be easy  
- can I set up rule on a router to alarm when there are ARP replays with gateway IP and other than router's MAC? (seems reasonable)  
- I want to dive deeper into sslstrip. How exactly does it work?  


Offtop:
- can I force nmap to NOT use ARP on LAN like crazy?  
- can we try step by step scanning stealthier than flooding with requests?  
- for `smb` evaluation I blindly used `NSE` scripts against `smb`. Some other ways (more precise and/or more broad ones?  
- any ideas why `iwctl` has troubles with connecting to home router, but no with hot spot?  
- what store  it store?
```
`XDG_DATA_HOME`

-   Where user-specific data files should be written (analogous to `/usr/share`).
-   Should default to `$HOME/.local/share`
```