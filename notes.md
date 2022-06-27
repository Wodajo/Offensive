`proxychains` - program for making proxy chains D:  
`aigeddon` - great for DoS  
`sudo wifite -mac --dict /home/kali/Desktop/Pentest/rockyou.txt --kil` nice:>

- test how's it working (there were some problems - bad servers? misconfiguration on networking settings?)  

- Network scanning practice&polishing (time for GNS3 labs!)

- DNS - i.a. for sake of footprinting and enumeration chapters. Configure your own DNS server


Wierd:
- `sudo nmap -Pn -sS -p- 10.0.2.14 | grep ^[0-9] | awk -F"/" '{print $1}' | sed 's/\n/,/g'` doesn't substitute newline with a comma. I don't understand why
- I can't force `nmap` to not use ARP on LAN
