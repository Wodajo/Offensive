hash cracker (dictionary, bruteforce, role-based)  
ftons of supported hash types and great word generator  

strip hashes of surrounding witespaces

### usage
If no mode specified - single -> wordlist -> incremental  

finded passwd -> `~/.john/john.pot` - on restart john reads it, so it doesn't try to crack already done passwd  

`john -show passwd`  **same directory where the password was cracked**  
(if cronjob -`/var/lib/john`)  

If `ctr+c` - save point into `~/.john/john.rec` (saves also every 10 min)  
`john -restore` 

`ls /usr/share/doc/john/` - usefull manuals (e.g. `README.kwallett` - instructions for cracking `KWallet`)

`~/.john/john.ini`, `~/.john/jon.conf` & `/etc/john/john.conf` - config files

### options
In manual options are prepended with one `-`, but most people (including some dev's writing documentation) use `--`

`-format:NAME` - override ciphertext format detection  
(`john --list=formats` - supported formats)  
u can pass many hashes **of the same type**  
`john -format=RAW-MD5 -wordlist=/usr/share/wordlists/seclists/Passwords/Leaked-Databases/rockyou-50.txt hashestocrack.txt`  

`-groups:[-]GID[,..]` - load users of this group only  
eg.  
`john --show --groups=0,1 stolen_shadow_file` - checks for priviledged groups  

`-users:[-]LOGIN|UID[,..]` - filter few accounts for cracking   
[-] before mean "use all not listed here"  
e.g.  
`john --show --users=0 stolen_shadow_file1` - shows if root (UID 0) is cracked  
`john --show --users=root stolen_shadow_file1` - shows if root (username root) cracked  
`john --show --users=0 *shadow* *.pwd` - shows if any root accounts cracked in multiple files  

`-incremntal[:MODE]`  incremental mode  
(using  definition specified in `~/john.ini`)  

`-makechars:FILE` generates charset file for incremental mode   
by default use entire `~/.john/john.pot`  

`-restore[:FILE]` restore interrupted cracking session  
by default `~/.john/john.rec`

`-rules` wordlist rules read from [List.Rules.Wordlists] in `/etc/john/john.conf`  
requires `-wordlist` option as well  

`-wordlist:FILE` wordlist mode, reading from file

### modes
- Wordlist
dictionary attack  
- Single crack
use login/GECOS (gecos - record of general info about user, like name, tel. nr. mail etc.) as paswd  
- Incremental
true bruteforce  
more info: `/usr/share/doc/john/RULES`