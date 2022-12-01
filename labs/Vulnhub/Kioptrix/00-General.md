`nmap -T4 -p- -A`
OS detection • version detection • script scanning • traceroute
default timing template is `T3`, trainer likes to use `T4`


`nikto` - automatic webapp vuln scanner (add to tools and check how it works)
`nikto -h http://192.168.1.107`
`-h` host

`dirbuster`, `gobuster` - discovery of subdirectories


- create a vault for a box
scripts should automate basic commands and make pretty output for Obsidian
	- `host_discovery.sh`:
		ARP scan
		ICMP echo request, timestamp, netmask, IP scan, SCTP scan, TCP SYN to 443, TCP ACK to 80, reverse resolution
		UDP scan
	- `initial_scan.sh` - script for 1 target:
		ping
		SYN scan
		SCTP scan
		IP scan
		UDP scan
	- `banner_grab.sh `- branner grabbing for 1 target, use `initial_scan.sh` output!
		