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
-  `iwctl` has problems with connecting to home router, but doesn't with hot spot (arch installation)  
- is `RST` on `SYN/ACK` a kernel decision on empty port? I'm looking for zombie for IDLE scan, and I'm not sure if it make sense to write a tool for `SYN/ACK`->`RST` response behavour on more ports than default 0 (hping3)
- TCP port 0 - on Unix wildcard port that tells the system to find a suitable port number. Accordnig to TCP/IP suite it shouldn't be used. 
- Should I see reassambled TCP segments with wireshark (just wireshark added feature), or does it mean that kernel reasssambled it before sending??