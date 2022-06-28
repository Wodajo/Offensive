`proxychains` - program for making proxy chains D:  
`aigeddon` - great for DoS  
`sed -z 's/\n/,/g'` needs `-z` flag to change line separators from \n to \0 (null). That way you can substitute newlines.    

`sudo wifite -mac --dict /home/kali/Desktop/Pentest/rockyou.txt --kil` nice:>

- test how's it working (there were some problems - bad servers? misconfiguration on networking settings?)  

- Network scanning practice&polishing (time for GNS3 labs!)

- DNS - i.a. for sake of footprinting and enumeration chapters. Configure your own DNS server


Wierd:

- I can't force `nmap` to not use ARP on LAN
- How can I perform smb evalutaion? Using NSE scripts blindly doesn't seem precise
