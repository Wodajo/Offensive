We want to split TCP header over several packets.  
Ofc all splited TCP are encapsulated in IP headers  

Roughly `MTU` (link-layer) = `MSS` + TCP&IP headers  
Here we're rather sending TCP segments with empty data field and no options (TCP header = 20 bytes). We assume that all TCP data is header  

`--mtu SizeInBytesMUSTBeAMultipleOfEight`  
works for raw packet features (TCP&UDP port scans [except FTP bounce & sT], OS detection)  
NOT for NSE (like `-sV`, `-sV`) - depends on TCP stack  

`sudo nmap --mtu 8 -sS 192.168.1.124` - split 20 byte TCP header into 2x8 + 1x4  
```
Starting Nmap 7.92 ( https://nmap.org ) at 2022-07-08 13:22 EDT
Nmap scan report for WIN-845Q99OO4PP (192.168.1.124)
Host is up (0.00028s latency).
Not shown: 991 closed tcp ports (reset)
PORT      STATE SERVICE
135/tcp   open  msrpc
139/tcp   open  netbios-ssn
445/tcp   open  microsoft-ds
49152/tcp open  unknown
49153/tcp open  unknown
49154/tcp open  unknown
49155/tcp open  unknown
49156/tcp open  unknown
49158/tcp open  unknown
MAC Address: 08:00:27:EE:9A:B0 (Oracle VirtualBox virtual NIC)
```

Check with `wireshark` if packets are sent while fragmented.