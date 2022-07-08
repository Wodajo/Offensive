# Last Day - Metasploitable1

## Env setup
- [x] Run Kali Linxu
- [x] Install Metasploitable 1 in VirtualBox
	- System 64
	- Network Nat
	- Confirm that Metasploitable 1 is up
- [x] In kali install Obsidina (Optional)
	- plugin: plaintext for obsidina  (Optional)
	- plugin: checklist (Optional)
	- Confirm that Obsidian is installed.


## Host delection
- [x] Find the target by `arp-scan` scan
	- `sudo arp-scan -l`
	- M1 IP: 10.0.2.12
- [x] Find the target by `nmap` scan
	- Confirm that you find all hosts in network by nmap


## Confirm that host is reachable
-  Use ping to confirm that machine is up
	- `ping -c 10 10.0.2.13 | tee ping.md`
	- [x] What is ttl and what it mean ?


## TCP
- [x] How many TCP ports are open ?

## UDP
- [x] How many UDP ports are open ?


## Collect information about target
- Execute nmap initinal scan to collect information about host
- `nmap -p- 10.0.2.13 | grep -e "^[0-9]" | awk '{print "[["$1$3"]]"}' | sed "s/\/tcp/-/g"`
- Initial scan check what is open
	- [x] How many service was identified by nmap, how many are unknown ?
	- [x] How many web services do you see, what are the worst ports ?
	- [x] How many database ports do you see, what are the ports ?
	- [x] Any DNS ports do you see ?
- Collect more infotmation about target
	- `nmap -p- -sC -sV -oN nmap.raw.txt 10.0.2.13`
	- [x] What `-sC` mean ?
	- [x] What `-sV` mean ?
	- [x] What `-oN` mean ?
		- [x] Do you know other formats ?
		- [x] Can you force nmap to use all format in one scan ?


## Ftp (21-ftp page)
- [x] Create page for **21-ftp**
	- Copy nmap result for that port
	- clean notes
	- Confirm that page 21-http is created
- Use `searchsploit` to find exploit
	- [x] Did you find any exploits ?
- Use `exploit-db` to find exploit
	- [x] Did you find any exploits ?
- Try to login as `anonymous`
	- [x] Do you see any files?


## Web (80-http page)
- [x] Crete page for **80-http**
	- Copy nmap result for port 80
	- clean nots
	- create screenshot
	- Mark what is important
Run **gobuster**
- run `gobuster dir --url 10.0.2.13 -w /usr/share/wordlists/dirbuster/directory-list-2.3-medium.txt -o gobuster.md`
	- [ ] any interesting resources ?
- Use `http-title` to check if nmap see any page title ?
	- [ ] Confirm nmap script execution
-  Any holes in TikiWiki ?
	- `tikiwiki_g...._f....._exec`
	- **not ROOT! but www-data** 


## Web (8180-http page)
- [ ] Create page for **8180-http**
	- What is there ?
	- [ ] Any innteresting subresources ?
- [ ] Try to get access to restricted resources
- [ ] Any default credentials ?
- Can you exploit it `tomcat_mgr_deploy` ?
	- [ ] **notROOT by tomcat55!**


## Samba (139-445 page)
- [ ] Crete page for 139-445-ports
- [ ] Run `smb-enum-users.nse` nmap script.
	- [ ] Put finding in notes
	- That can be usefull `cat smb-enum-users| grep 'METASPLOITABLE' | cut -d ' ' -f4 | cut -d '\' -f2 > users.txt`
- [ ] Run `smb-enum-shares.nse` nmap script.
	- [ ] Put finding in notes
	- [ ] How many `Anonymous access` do you have ?
- Find Exploit by version
	- try `searchsploit` 
	- try `exploit-db.com`
	- [ ] Found CVE-2007-2447
	- [ ] Run exploit
		- [ ] **ROOT**
- Find Exploit by enum4linux
	- Did you find exploit by this tool ?
	- Try to find `Mapping: OK` in output
	- [ ] Found CVE-2010-0926
	- [ ] use msf `samba_symlink_traversal`
		- [ ] Access to **ROOT!** 


## distcc (3632-distcc page)
- Crete page for **3632-distcc**
- Find exploit for distcc by
	- try `searchsploit` 
	- try `exploit-db.com`
	- btw I like that payload `cmd/unix/reverse`
	- [ ] **not ROOT! by daemon**


## psql (5432-psql page)
- Create page for **5432-sql**
- Find exploit by PostgreSQL DB 8.3.0 - 8.3.7
- [ ] **no ROOT! by postgres**

