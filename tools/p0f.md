passive OS detection  
(especially beneficial to run on gateways)  

`sudo p0f -i eth0 -p -o /tmp/p0f.log`  
`-i` interface  
`-p` promiscuous mode - NIC passes all traffic into CPU (instead only frames it is specifically programmed to receive). Allow to intercept and read packets in its entirety.  
Must be supported both by NIC and input/out OS driver  
`-o` save output to  

