`hash-identifier` herp derp  

`hashcat` i.a. dictionary, brute force, role based hash cracking  
`hashcat -a 3 -m 1700 /home/user/SHA512_hash.txt --increment --increment-min 6 --increment-max 6 -1 ?l?u?d ?1?1?1?1?1?1`  
`-a` attack mode (here `3` - bruteforce), `-m` mode i.e. type of cracked hash (`1700` - SHA512), `-1` create new charset  
 use `-o results.txt` flag OR after cracking - type the same command with appended `--show` 

`john --format=RAW-MD5 --wordlist=/usr/share/wordlists/seclists/Passwords/Leaked-Databases/rockyou-50.txt hashestocrack.txt`  

`crunch <min-length> <max-length> <character-pool> -o <file-name>` generates passswords  

`ncrack -U /usr/share/wordlists/seclists/Usernames/cirt-default-usernames.txt -P /usr/share/wordlists/seclists/Usernames/cirt-default-usernames.txt ftp://10.0.2.15:21 -v`  

for encodings [cybershef](https://cyberchef.org/)  
