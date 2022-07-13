hash cracking (dictionary, bute-force, role-based)  
written to support GPU cracking (v. fast with GPU)  

`hashcat -a 3 -m 1700 /home/user/SHA512_hash.txt --increment --increment-min 6 --increment-max 6 -1 ?l?u?d ?1?1?1?1?1?1`  
`-a` attack mode (here `3` - bruteforce), `-m` mode i.e. type of cracked hash (`1700` - SHA512), `-1` create custom charset  

use `-o results.txt` flag  
OR  
after cracking type the same command with appended `--show`  