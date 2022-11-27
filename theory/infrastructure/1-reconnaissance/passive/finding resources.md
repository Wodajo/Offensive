nmap
[bluto](https://github.com/darryllane/Bluto)?

##### Advanced search
`"search phrase"` - exact same phrase
`OSINT filetype:pdf` - filetype (can be e.g. `doc`, `docx`, `ppt`, `pptx`, `xls` or `xlsx`)
`salary site:blog.tryhackme.com` - site-sepecific
`pentest -site:example.com` - exclude that site
`site:tesla.com -www` - exclude `www` -> subdomain discovery
`walkthrough intitle:TryHackMe` - specific title
`challenge inurl:tryhackme` - specific page in URL

references: [Google](https://support.google.com/websearch/answer/2466433), [DDG](https://help.duckduckgo.com/duckduckgo-help-pages/results/syntax/), [Bing](https://support.microsoft.com/en-us/topic/advanced-search-options-b92e25f1-0085-4271-bdf9-14aaea720930)
[Google Hacking Database](https://www.exploit-db.com/google-hacking-database) - prepared advance search terms (part of `expoit-db`)

##### internet archive
https://archive.org/web/


#### subdomains
`sublist3r -h` help
`sublist3r -d mp.pl`

[crt.sh](https://crt.sh) - pass the domain name / organisation name -> fingerprint using certificates

`amass` - probably the best recon tool here, but slower than above

`burp` - site map