```bash
#!/bin/bash

if [ "$1" == "" ]
then
	echo "Scanner works only for 1 target"
	echo "Scanner uses initial_scan.sh output files"
	echo "Enter target IP"
	echo "Syntax: ./banner_grab.sh 192.168.4.1"

else

echo "[+] selected IP: $1"
if [ ! -d "$1" ];then
	mkdir $1
fi
if [ ! -d "$1/logs" ];then
	mkdir $1/logs
fi

echo "[+] Creating nmap query (for sS sY sU)..."
tcp=$(cat $1/logs/.log-initial_scan_sS.md)  # $1 obviously wont be recognised by subshell - FIND A WAY


# loop with "nmap -A" cycling through ports -> export each one of results to separate logs
# update chronologically
# populate port list in main target page with entries after version detection


fi
```