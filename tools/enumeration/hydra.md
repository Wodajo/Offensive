login cracker  
supports:  
```
Cisco AAA, Cisco auth, Cisco enable, CVS, FTP, HTTP(S)-FORM-GET, HTTP(S)-FORM-POST, HTTP(S)-GET, HTTP(S)-HEAD, HTTP-Proxy, ICQ, IMAP, IRC, LDAP, MS-SQL, MySQL, NNTP, Oracle Listener, Oracle SID, PC-Anywhere, PC-NFS, POP3, PostgreSQL, RDP, Rexec, Rlogin, Rsh, SIP, SMB(NT), SMTP, SMTP Enum, SNMP v1+v2+v3, SOCKS5, SSH (v1 and v2), SSHKEY, Subversion, Teamspeak (TS2), Telnet, VMware-Auth, VNC and XMPP
```
list may differ (depending on libraries found during compile time) - `hydra` to check  

hydra [options]  [IP] [-s PORT]  [TARGET PROTOCOL]  [MODULE OPTIONS]

### examples
`sudo hydra -l admin -P common_passwd.txt ftp://192.168.1.103`

`sudo hydra -l root -p root ftp://[192.168.0.0/24]/`
[] needed when passing CIDR or IPv6

`sudo hydra -e snr ftp://192.168.1.103`

`sudo hydra -l admin -P rockyou.txt 10.10.141.47 -s 80 http-post-form "/admin:user=^USER^&pass=^PASS^:F=invalid" -o output_hydra`

### contains:
- `dpl4hydra` - generates dpl (default passwd list) of main vendors of network devices (aka brand)  
depends on `~/.dpl4hydra/dpl4hydra_full.csv`  
list of brand - `~/.dpl4hydra/dpl4hydra_BRAND.lst`  
e.g.  
`dpl4hydra dell` - creates a dpl for dell in `~/.dpl4hydra/`  

- `pw-inspector` - reads passwords in and prints those which meet the requirements  
e.g.  
`pw-inspector -i /usr/share/wordlists/rockyou.txt -o ~/workspace/passes.txt -m 6 -M 10 -n`  
`-i` read form that  
`-o` redirect output here  
`-m 6` min. length 6  
`-M 10` max. length 10  
`-n` must contain numbers  

- `hydra-wizard` - wizard asking neccessary questions to launch hydra  
(lame)  

- `hydra`

### options
single target - IPv4, IPv6 or hostname  
network range - "192.168.1.0/24"
list of hosts - `-M FILE` with one entry:port/line

it NEEDS service passed like `ftp://`  
port is needed only if not default  

`-R` restore previously aborted session  
(only one `hydra.restore` file - get's overwritten!)

`-S` via SSL
`-O` via SSL v2 or v3 (old SSL)  

`-s PORT` if service on wierd port  

`-l LOGIN`  
`-p PASS`  

`-L FILE` with logins  
`-P FILE` with passwds
`-C FILE` instead of `-L/-P`  
login:pass format  

`-e nsr` additional checks  
`n` null passwd, `s` login as pass, `r` reverted login as pass

`-x min:max:charset` generate passwds  
min length, max length,  
charset: `1` - numbers, `a` lowercase letters, `A` uppercase letters  
`-y` use symbols in `-x` bruteforce  

`-u` -> passwd checked on all logins -> next passwd  **THIS!!!**  
by default `hydra` checks all passwd for one login -> next login  

`-f` exit after first found login/passwd pair (if `-M` - per host)
`-F` exit after first found login/passwd pair on ANY host (for usage with `-M`)

`-M FILE` with list of servers to paralelly attack.
one entry/line  
: to specify port  

`-o FILE` to write found credentials  

`-b FORMAT` specify format of output file (text by default)

`-t TASKS` number of parallel connections (default - 16)

`-m OPTIONS` options for current module  
to check module options run `hydra -U PROTOCOL`  
e.g. `hydra -U smtp`

`-w TIME` timeout (default 22s)  

`-W TIME` connection delay of current task
Only make sense when low `-t` (like `-t 1`)

`-c TIME` connection delay over all threads (tasks)  
Only make sense when low `-t`  

`-4/-6` prefere IPv4 or IPv6

`-v` show login+pass combination for each attempt
### modules
#### http-post-form, https-post-form, http-get-form, https-get-form

either `www.example.com module optional_module_parameters`
or `module://www.example.com/optional-module-parameters`
(I have no idea how to properly use former)

`[url]:[form parameters]:[condition string][:(optional)[:(optional)]`
`[url]` - page on the server to GET or POST
`[form parameters]` - POST/GET variables (taken from either the browser, proxy, etc. with usernames and passwords being replaced in the “`^USER^`” and “`^PASS^`”
`[condition string]` - checks for success or failure of logon
Invalid condition login check can be preceded by “`F=`”, successful condition login check must be preceded by “`S=`”

e.g.
`sudo hydra -l admin -P rockyou.txt 10.10.141.47 -s 80 http-post-form "/admin:user=^USER^&pass=^PASS^:F=invalid" -o output_hydra`
