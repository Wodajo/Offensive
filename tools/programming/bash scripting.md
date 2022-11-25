### ping sweep

```shell
#!/bin/bash

if [ "$1" == "" ]
then
echo "You forgot IP address"
echo "Syntax: ./ipsweep.sh 192.168.4"

else
for ip in `seq 1 254`; do
ping -c 2 $1.$ip | grep "64 bytes" | cut -d " " -f 4 | tr -d ":" & 
# $1 means first argument passed to that script (e.g. ./ipsweep 192.168.4)
# & allow multiple instances of loop to run at once. It could be ; if you want BUT there won't be next loop iteratioan until previous one finish
# remember that this only sends requests (no timeout management)
done
fi
```

`./ipsweep 192.168.1 > ipsweep.txt`

`for ip in $(cat ipsweep.txt); do nmap $ip & done` - you can use `;` instead of `&` (as in script)


### web enumeration

```shell
#!/bin/bash

url=$1

if [ ! -d "$url" ]; then
mkdir $url
fi
if [ ! -d "$url/recon" ]; then
mkdir $url/recon
fi

echo "Harvesting subdomains with assetfindeer..."
assetfinder $url >> $url/recon/assets.txt  # also related subdomains (maybe out of scope)
cat $url/recon/assets.txt | grep $1 >>$url/recon/final.txt  # extract what is truly needed
rm $url/recon/assets.txt

echo "Harvesting subdomains with amass..."
amass enum -d $url >> $url/recon/f.txt
sort -u $url/recon/f.txt >> $url/recon/final.txt  # output only unique
rm $url/recon/f.txt

echo "Probing for alive domains..."
cat $url/recon/final.txt | sort -u | httprobe -s -p https:443 | sed s_https\?\/\/// | tr -d ':443' >> $url/recon/alive.txt  # check for answer only on 443 HTTPS servers, sed and tr for clean output

```