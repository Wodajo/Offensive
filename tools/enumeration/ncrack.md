Great timing options, many restoration points  
BUT  
interactive mode not working:<  

network authentication cracking tool  
support:
```
SSH, RDP, FTP, Telnet, HTTP(S), Wordpress, POP3(S), IMAP, CVS, SMB, VNC, SIP, Redis, PostgreSQL, MQTT, MySQL, MSSQL, MongoDB, Cassandra, WinRM, OWA, DICOM
```

ncrack [options]  [target and service specification]

### examples
`ncrack -U /usr/share/wordlists/seclists/Usernames/cirt-default-usernames.txt -P /usr/share/wordlists/seclists/Usernames/cirt-default-usernames.txt 10.0.2.15:21 -v`  

#### target specification
similar to nmap  
`-iX/iN/iL` - input from nmap `-oX`, input form nmap `-oN`, input from list (like from nmap `-iL`)  
`--exclude` and `--excludefile` - host/networks to be excluded from scan even if they are part of the overall network range

#### service specification
##### per-host
`[service name]://[target IP/hostname]:[port nr.]`  
[service name] - makes ncrack assume default port  
[port nr.] - makes ncrack assume default service for that port  
if you pass both - you have to have *a priori* knowledge of both (e.g. nmap `-sV`)  
e.g.  
`sudo ncrack ssh://192.168.1.*:5910`  

##### global
applied to **all** hosts that haven't been associated with per-host service specification  
`-p [service1]:[port1],[service2]:[port2]`  
e.g.  
`sudo ncrack scanme.nmap.org wp.pl -p 22,ftp:3210,telnet`

### options
per-host > per-module > global > timing-template  
`sudo ncrack scanme.nmap.org:22,cl=10,at=1 10.0.0.120 10.0.0.20 -p21 -m ftp:CL=1 -g CL=3`  
SSH for `scanme.nmap.org`, FTP for the rest.  
No particular timing -> default = 3  
per-host option for `scanme.nmap.org` - `cl` minimum connection limit = 10  
`at` only 1 authentication try per connection  

#### per-host
`[service]://[taget]:[port],opt1=optval1,opt2=optval2`
#### per-module
apply to all hosts associated with particular service/mode  
`-m service:opt1=optval1,opt2=optval2`  
#### global
apply to all hosts  
`-g opt1=optval1,opt2=optval2`

#### list of options
##### service
`ssl` - if `ssl=yes` ncrack open TCP connection -> negotiate a SSL session  

`path <name>`  - for services like HTTP. path is always relative to hostname/IP address so http://foobar.com/login.php -> `path=login.php`.  
If you want to crack a dir http://foobar.om/protected-dir/ -> `path=protected-dir/`  (remeber about the "/" at the end)  
**If  ''`=`'' in URL - escape it**

`db <name>` - some services need database name to crack (e.g. MongoDB)
default name='admin'

`domain <name>` -  some services need domain name to crack (e.g. WinRM)
default='workstation'

##### timing
'ms', 's', 'm', 'h' - default 's'

`cl`/`CL` [min. connection limit]/[max. connection limit]  
ncrack ajust number of parallel connections to the same service automatically (e.g. lowers if host start dropping connections) BUT you can manually override

`at` [nr. of authentication tries/connection]  
Most services pose an upper ilmit on number of authentication per connection  
ncrack initially sends reconnaisance probe that lets it calculate the maximum number of auth. tries.  
Setting it manually to lower give stealth bonus (SSH tend to log failed attempts after >certain nr. of auth. tries/connection)  

`cd` [connection delay time]  
ncrack initiate new connection as fast as [connection limit] and [connection delay] allows.  
That is fast, BUT can lead to:
- triggered fw (dropping based on src. IP)
- triggered IDS
- diminished bandwidth (yours or tardet's)
- DoS of attacked service

`cr` [max. con. retries]  
maximum amount of consecutive failed attempts.  
If ncrack fails to connect agaiuns such service - **it stop cracking it entirely**

`to` [timeout]  
afer timeout ncrack stop, regardless of whether it has found some credentials or not.  
E.g. for nightime cracking  

`-T` [paranoid(0)|sneaky(1)|polite(2)|normal(3)|aggressive(4)|insane(5)]  
not realy that usefull.  
It's best to manage `cl`, `CL`, `at`, `cd`, `cr` manually  

##### authentication
ncrack user&passwd lists in `/usr/share/ncrack` or `/usr/local/share/ncrack`  
If no list specified ncrack use default one  


`-U` [path-to-filename-list]  

`-P` [path-to-passwd-list]  

`--user` [usernames]  
comma-separated via cli  

`--pass` [passwds]  
comma-separated via cli  

`--passwords-first`  
reverse the way of passwd iteration  
default order:  
user1:pass1, user2:pass1, user3:pass1  
after `--passwords-first`:  
user1:pass1, user1:pass2, user1:pass3  
Especially usefull if you want to first check some users, than others (like `root` and `admin`)  

### output
`-oN/oX` - normal output, XML output  

`-v` - i.a. credentials are shown as they are found  

`--resume` [path-to-file]  
If you interrupt cracking (e.g. ctrl+c) ncrack save session into `$HOME/.ncrack/restore.YY-MM-DD_hh-mm`  
You can load from that file :D

`-f` - stop cracking when 1 credential/host is found  
if `-f -f` it will stop completly if credentials are found at any service

`--proxy type://proxy:port` - connections via `socks4`, `4a`, `http`  
perform cracking via specified proxy host  

`-sL` only list targets