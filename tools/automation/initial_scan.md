```bash
#!/bin/bash

if [ "$1" == "" ]
then
	echo "Scanner works only for 1 target"
	echo "Enter target IP"
	echo "Syntax: ./innitial_scan.sh 192.168.4"

else

echo "[+] selected IP: $1"
if [ ! -d "$1" ];then
	mkdir $1
fi
if [ ! -d "$1/scans" ];then
	mkdir $1/scans
fi

echo "[+] ping..."
echo "typical for ICMP echo reply ttl IP header field: 64 linux (some kernels 255), 128 windows, 255 solaris&networking dev.

here: " > $1/scans/initial_scan.txt
ping -c 2 $1 | grep "ttl=" | cut -d " " -f 6 >> $1/scans/initial_scan.txt
echo "
" >> $1/scans/initial_scan.txt
echo "[+] Syn scan..."
sudo nmap -Pn -p- -sS $1 >> $1/scans/initial_scan.txt
echo "[+] SCTP scan..."
sudo nmap -Pn -p- -sY $1 >> $1/scans/initial_scan.txt
echo "[+] IP scan..."
sudo nmap -Pn -p- -sO $1 >> $1/scans/initial_scan.txt
echo "[+] UDP scan..."
sudo nmap -Pn -sU $1 >> $1/scans/initial_scan.txt

fi

```