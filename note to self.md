- Some more of Computer Networking 8th (one more chapter)  
- Network scanning practice&polishing (GNS3 labs!)  
It would be good to re-write "workflow" (step-by-step minimal-footprint oriented scanning) - for now it won't be as stealthy as I would like to (it would be best to configure `fw` and only leave a crevice for `p0f`), but it will help to better understand  
After re-writing "workflow" - updates other notes  
- Finish DNS notes & configure your own DNS (on arch)  
- Update chapters with new tools (mainly wifi hacking and try `john` against telnet)  



Wierd:

- I can't force `nmap` to not use ARP on LAN - investigate  
- some problem with executing ncrack dict attack on telnet.  
`sudo ncrack -U /usr/share/wordlists/seclists/Usernames/cirt-default-usernames.txt -P /usr/share/wordlists/seclists/Usernames/cirt-default-usernames.txt 10.0.2.13 -p 23`

-`iwctl` has problems with connecting to home router, but doesn't with hot spot (arch installation)  
