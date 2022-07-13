### banner grabbing
`nc -vn 192.168.1.103 23`  
`-v` verbose  
`-n` no DNS resolution  

`sudo nmap -Pn -n --script "*telnet* and safe" -p 23 192.168.1.103`  
`-Pn` no host discovery  
`-n` no reverse-DNS resolution
possibly some intresting info (`telnet-ntlm-info.nse` will obtain NTLM info (Windows versions))

