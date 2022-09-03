### Metasploit - YOU HAVE TO POLISH IT
framework for building and performing exploit attacks.  
Paid version has also: OWASP Top 10 tools, dynamic payloads for anti-virus evasion and a web interface.  
[Armitage](https://github.com/rsmudge/armitage) is an open source graphical cyber attack management tool for Metasploit. I've seen infos that it has comparable functionality to paid MSF  

you can use `postgresql.service` - better performance and you can save info about infrastructure

`msfconsole` metasploit shell wrapper. Most features and most stable from MSF interfaces  
tools are categorised into modules:  
`**aux**iliary` i.a. scanners. e.g. `search aux ftp`  
`**exp**loit` e.g. `search exp ftp`  
`**post**` e.g. `search post ftp`  

`info 0`  
`info <name>` info about tools listed by cmd above  

`use 0`  
`use <name>` take a tool to a workshop  
`options`  
`set RHOSTS 10.0.2.5` set variables to desired values  
`setg RHOSTS 10.0.2.5` set variables globally (for all tools)
`unset RHOSTS`  
`unsetg RHOSTS`
`run` run prepared tool  
`exploit` same as run?
`sessions` if a tool graned you TCP connection (e.g. ssh, telnet and such) it is accessable as session. That cmd prin out all sessions.  
`sessions -i 1` connect to a session with ID 1  
`sessions -h` example of built-in help. MSF is big  
`background` move a session back to background  
`back` navigation  

inside `meterpreter` you can load extensions:
`load kiwi`
`help kiwi`

