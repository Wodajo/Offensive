enumeration of:  
URI (web apps)  
Virtual hostname (web servers)  
DNS subdomains  
Open Amazon S3 buckets  

`gobuster dir -u http://facebook.com -w wordlist.txt -o output.txt -x php,txt,html -q`
`dir` mode, `-u` URL/IP, `-w` wordlist, `-o` where write output, `-x` extension of what we're looking for
`-q` less stuff - show only what is found

help e.g. `gobuster dir --help`