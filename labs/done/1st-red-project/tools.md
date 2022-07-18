`hash-identifier`  identifies... I dunno... sth  

`hashcat` i.a. dictionary, brute force, role based hash cracking   
`hashcat -a 3 -m 1700 /home/user/SHA512_hash.txt --increment --increment-min 6 --increment-max 6 -1 ?l?u?d ?1?1?1?1?1?1`    
`-a` attack mode (here `3` - bruteforce), `-m` mode i.e. type of cracked hash (`1700` - SHA512), `-1` create new charset  (here `?1` means the same character pool that `?l` `?u` and `?d` togheter)  
use `-o results.txt` flag OR after cracking type the same command with appended `--show` (second option seems more stable)

`john --format=RAW-MD5 --wordlist=/usr/share/wordlists/rockyou.txt hashestocrack.txt`

`sudo wifite -mac --dict /home/kali/Desktop/Pentest/rockyou.txt --kil`

`aircrack-ng`  UPDATE

`ftp` You should learn more

`msfconsole`
`wireshark`
`ssh`
`scp`

