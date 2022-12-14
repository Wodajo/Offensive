#!/usr/bin/env bash

# host discovery for LAN

MAIN_LOG="log-host_discovery.md"

if [ "$1" == "" ]
then
	echo "No IP range given"
	echo 'Syntax: ./host_discovery.sh 192.168.1.0/24'
else
# Add creation of main documentation pages (network, targets)
# and first parts of target-specific pages
	echo "[+] ARP scan..."
	cat <<- _EOF_ >> $MAIN_LOG
	proxy ARP might make every target appear up -> ARP only with arp-scan, NOT with nmap
	\`\`\`
	sudo arp-scan $1
	$(sudo arp-scan $1)
	\`\`\`

	_EOF_

	echo "[+] Creating a full list of IP addresses"
	sudo nmap --resolve-all --disable-arp-ping -sL $1 | grep report | awk '{print $(NF)}' > full_list_of_IPs.txt
	# --resolve-all - applies only when nmap has to resolve names with DNS
	# --disabe-arp-ping - no ARPscan for host discovery - proxy ARP might make every target appear up 
	
	echo "[+] ICMP echo request, timestamp, netmask, IP scan, SCTP scan, TCP SYN to 443, TCP ACK to 80, reverse resolution..."
	cat <<- _EOF_ >> $MAIN_LOG
	\`\`\`
	sudo nmap --disable-arp-ping -PM -PO -PY -R -sn -iL full_list_of_IPs.txt
	$(sudo nmap --disable-arp-ping -PM -PO -PY -R -sn -iL full_list_of_IPs.txt)
	\`\`\`

	_EOF_
	# -PM ICMP netmask, -PO IP scan, -PY SCTP scan, -R reverse DNS resolution for all hosts (even down ones)
	# -sn ICMP echo request & timestamp, TCP SYN to 443, TCP ACK to 80, omits futher port scannin

	
	echo "[+] UDP scan..."
	cat <<- _EOF_ >> $MAIN_LOG
	\`\`\`
	sudo nmap --disable-arp-ping -PU -sn -iL full_list_of_IPs.txt
	$(sudo nmap --disable-arp-ping -PU -sn -iL full_list_of_IPs.txt)
	\`\`\`

	_EOF_
	# you might want to change DEFAULT_UDP_PROBE_PORT_SPEC in nmap.h from default port (40125)

	# if you're desperate you might want to omit host discovery and blind port-scan every possible host
	rm full_list_of_IPs.txt
fi
