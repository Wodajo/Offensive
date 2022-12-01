```bash
#!/bin/bash

if [ "$1" == "" ]
then
	echo "Scanner works only for 1 target"
	echo "Enter target IP"
	echo "Syntax: ./initial_scan.sh 192.168.4.1"

else
# Create "chronologically" page in target directory.
# Update it with links to logs
echo "[+] selected IP: $1"
if [ ! -d "$1" ];then
	mkdir $1
fi
if [ ! -d "$1/logs" ];then
	mkdir $1/logs
fi

echo "[+] ping..."
echo "typical ICMP echo reply ttl IP header field: 64 linux (some kernels 255), 128 windows, 255 solaris&networking dev."
ping -c 2 $1 | grep "ttl=" | cut -d " " -f 6 >> $1/logs/log-initial_scan_$1.md

echo "[+] Syn scan..."
echo '
```'  >> $1/logs/log-initial_scan_$1.md
echo "sudo nmap -Pn -p- -sS $1 " >> $1/logs/log-initial_scan_$1.md
sudo nmap -Pn -p- -sS $1 > $1/logs/.log-initial_scan_sS_$1.md
cat $1/logs/.log-initial_scan_sS_$1.md >> $1/logs/log-initial_scan_$1.md
echo '```' >> $1/logs/log-initial_scan_$1.md

echo "[+] SCTP scan..."
echo '
```'  >> $1/logs/log-initial_scan_$1.md
echo "sudo nmap -Pn -p- -sY $1" >> $1/logs/log-initial_scan_$1.md
sudo nmap -Pn -p- -sY $1 > $1/logs/.log-initial_scan_sY_$1.md
cat $1/logs/.log-initial_scan_sY_$1.md >> $1/logs/log-initial_scan_$1.md
echo '```
' >> $1/logs/log-initial_scan_$1.md

echo "[+] IP scan..."
echo '
```'  >> $1/logs/log-initial_scan_$1.md
echo "sudo nmap -Pn -p- -sO $1" >> $1/logs/log-initial_scan_$1.md
sudo nmap -Pn -p- -sO $1 > $1/logs/.log-initial_scan_sO_$1.md
cat $1/logs/.log-initial_scan_sO_$1.md >> $1/logs/log-initial_scan_$1.md
echo '```
' >> $1/logs/log-initial_scan_$1.md

echo "[+] UDP scan..."
echo '
```'  >> $1/logs/log-initial_scan_$1.md
echo "sudo nmap -Pn -sU $1" >> $1/logs/log-initial_scan_$1.md
sudo nmap -Pn -sU $1 > $1/logs/.log-initial_scan_sU_$1.md
cat $1/logs/.log-initial_scan_sU_$1.md >> $1/logs/log-initial_scan_$1.md
echo '```
' >> $1/logs/log-initial_scan_$1.md

fi

```