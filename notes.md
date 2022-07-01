`proxychains` - program for making proxy chains D:  
- test how's it working (there were some problems - bad servers? misconfiguration on networking settings?) 

`aigeddon` - great for DoS  

`sed -z 's/\n/,/g'` needs `-z` flag to change line separators from \n to \0 (null). That way you can substitute newlines.    

`sudo wifite -mac --dict /home/kali/Desktop/Pentest/rockyou.txt --kil` nice:>


- Network scanning practice&polishing (time for GNS3 labs!)

- DNS - i.a. for sake of footprinting and enumeration chapters. Configure your own DNS server


Wierd:

- I can't force `nmap` to not use ARP on LAN
- How can I perform smb evalutaion? Using NSE scripts blindly doesn't seem precise
or maybe could I list CVE's of current service and enumerate by them? That would be cool
- some problem with executing ncrack dict attack on telnet.  
`sudo ncrack -U /usr/share/wordlists/seclists/Usernames/cirt-default-usernames.txt -P /usr/share/wordlists/seclists/Usernames/cirt-default-usernames.txt 10.0.2.13 -p 23`
- why `iwctl` has problems with connecting to home router, but doesn't with hot spot?
