### search for subdomains

`assetfinder thm.com`

`amass enum -d thm.com`
`-d` domain ofc

### check if subdomain is alive

`cat ListOfSubdomains.txt | sort -u | httprobe -s -p https:443`
`-s` HTTPS only

