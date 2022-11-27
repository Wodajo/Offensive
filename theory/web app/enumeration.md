### search for subdomains
`assetfinder thm.com`

`amass enum -d thm.com`
`-d` domain ofc

`sublist3r -h` help
`sublist3r -d mp.pl`

[crt.sh](https://crt.sh) - pass the domain name / organisation name -> fingerprint using certificates

`burp` - site map & insight into HTTP headers


### check if subdomain is alive

`cat ListOfSubdomains.txt | sort -u | httprobe -s -p https:443`
`-s` HTTPS only


#### What to look for on a website
- service&version info
- directories & any kind of backend
- src. code
- vulnerability scanning (nikto)
- any disclosure info