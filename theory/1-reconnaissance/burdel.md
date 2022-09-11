Open-source intelligence

##### WHOIS
`domain registrar` is responsible for maintaining the `WHOIS records` for the `domain names` it is leasing

`WHOIS` protocol:
- `WHOIS` server listens on TCP 43
- info:
	-   Registrar WHOIS server
	-   Registrar URL
	-   Record creation date
	-   Record update date
	-   Registrant contact info and address (unless withheld for privacy)
	-   Admin contact info and address (unless withheld for privacy)
	-   Tech contact info and address (unless withheld for privacy)
if we are lucky - names, email addresses, postal addresses, and phone numbers, other technical information

##### DNS
one `IP address` can be used by many different `web servers` with different `domain names`


`nslookup tryhackme.com`
```
Server:		10.26.0.1
Address:	10.26.0.1#53

Non-authoritative answer:
Name:	tryhackme.com
Address: 172.67.27.10
Name:	tryhackme.com
Address: 104.22.54.228
Name:	tryhackme.com
Address: 104.22.55.228
Name:	tryhackme.com
Address: 2606:4700:10::ac43:1b0a
Name:	tryhackme.com
Address: 2606:4700:10::6816:36e4
Name:	tryhackme.com
Address: 2606:4700:10::6816:37e4
```
use `A` and `AAAA` records as default


`dig tryhackme.com @1.1.1.1`  (`Domain Information Groper`)
```
; <<>> DiG 9.18.6 <<>> tryhackme.com @1.1.1.1
;; global options: +cmd
;; Got answer:
;; ->>HEADER<<- opcode: QUERY, status: NOERROR, id: 25272
;; flags: qr rd ra; QUERY: 1, ANSWER: 3, AUTHORITY: 0, ADDITIONAL: 1

;; OPT PSEUDOSECTION:
; EDNS: version: 0, flags:; udp: 1232
;; QUESTION SECTION:
;tryhackme.com.			IN	A

;; ANSWER SECTION:
tryhackme.com.		300	IN	A	104.22.54.228
tryhackme.com.		300	IN	A	104.22.55.228
tryhackme.com.		300	IN	A	172.67.27.10

;; Query time: 33 msec
;; SERVER: 1.1.1.1#53(1.1.1.1) (UDP)
;; WHEN: Sat Sep 03 10:19:44 CEST 2022
;; MSG SIZE  rcvd: 90
```
quering Cloudflares 1.1.1.1 DNS server


`host tryhackme.com`
```
tryhackme.com has address 104.22.54.228
tryhackme.com has address 104.22.55.228
tryhackme.com has address 172.67.27.10
tryhackme.com has IPv6 address 2606:4700:10::6816:36e4
tryhackme.com has IPv6 address 2606:4700:10::6816:37e4
tryhackme.com has IPv6 address 2606:4700:10::ac43:1b0a
tryhackme.com mail is handled by 10 alt4.aspmx.l.google.com.
tryhackme.com mail is handled by 1 aspmx.l.google.com.
tryhackme.com mail is handled by 5 alt1.aspmx.l.google.com.
tryhackme.com mail is handled by 5 alt2.aspmx.l.google.com.
tryhackme.com mail is handled by 10 alt3.aspmx.l.google.com.
```

[ViewDNS info](https://viewdns.info/)- give access to it's database of `WHOIS` and many cool things like `Chinese Firewall Test`
[Threat Intelligence Platform](https://threatintelligenceplatform.com/) - malware checks, `WHOIS` and `DNS` queries for `domain name` or `IP address`. Visually appealing output

`reverse IP lookup` is usefull bcos:
- we can see all `domain names` are used by particular `IP address`
  (we can start with `domain name` to see it's `IP address`, and than check the rest of domain names related to that IP)
- sometimes `domain names` suggest function of IP (e.g. `fw`)
- don't probe domains NOT in scope of your pentest

##### traceroute
many **DIFFERENT** implementations

`traceroute tryhackme.com`
```
traceroute to tryhackme.com (104.22.55.228), 30 hops max, 60 byte packets
 1  * * *
 2  vlan111.as06.waw1.pl.m247.com (217.138.209.145)  43.787 ms  43.825 ms  43.851 ms
 3  * * *
 4  146.70.1.90 (146.70.1.90)  47.464 ms  48.449 ms  47.487 ms
 5  cloudflare.plix.pl (195.182.218.134)  44.475 ms  44.513 ms  44.532 ms
 6  104.22.55.228 (104.22.55.228)  42.465 ms  25.681 ms  29.933 ms
```
usually use `UDP` datagrams

`tracert` on Windows
usually use `ICMP Echo request`

##### Advanced search
`"search phrase"` - exact same phrase
`OSINT filetype:pdf` - filetype (can be e.g. `doc`, `docx`, `ppt`, `pptx`, `xls` or `xlsx`)
`salary site:blog.tryhackme.com` - site-sepecific
`pentest -site:example.com` - exclude that site
`walkthrough intitle:TryHackMe` - specific title
`challenge inurl:tryhackme` - specific page in URL

references: [Google](https://support.google.com/websearch/answer/2466433), [DDG](https://help.duckduckgo.com/duckduckgo-help-pages/results/syntax/), [Bing](https://support.microsoft.com/en-us/topic/advanced-search-options-b92e25f1-0085-4271-bdf9-14aaea720930)
[Google Hacking Database](https://www.exploit-db.com/google-hacking-database) - prepared advance search terms (part of `expoit-db`)

##### internet archive
https://archive.org/web/


##### Recon-ng



##### testing of RCE
encode payload (e.g. in `base64`) - output shouldn't have any troublesome characters. That way we don't have to worry about payload encoding by Target
`echo 'payload in base 64' | base64 -d | sh`

##### OWASP 2017 -> A4 XML
xml external entity
```
<somexml><message>Hello World</message></somexml>
```
