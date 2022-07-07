Banner = name + version

### Active banner grabbing
OS have different TCP/IP stack implementations (i.a. TTL, TCP Window size in the IP header of the first packet)  
aka TCP/IP stack fingerprinting

##### ping
TTL - 64 (Linux), 128 (Windows), 256 (Network, Solaris)

##### telnet
still built in many OS  
`telnet <ip address> <port>`  
e.g. connect to port 80 and type `GET /index.html HTTP 1.0` or `HEAD / HTTP/1.1`

##### netcat (nc symlink)
`nc -nv <ip address> <port>` -n no DNS resolution, -v verbose  
use like telnet

##### nmap
`sudo nmap -O` i.a. TCP ISN sampling, TCP options support and ordering, IP ID sampling, and the initial window size check.  
far more effective if at least one `open` and `closed` port. If that criteria are not satisfied `--osscan-limit` will omit OS detection for the host  

`sudo nmap -sV` version detection scan  