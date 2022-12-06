ICMP echo reply ttl IP header field: 64 linux (some kernels 255), 128 windows, 255 solaris&network
```
PING 192.168.1.107 (192.168.1.107) 56(84) bytes of data.
64 bytes from 192.168.1.107: icmp_seq=1 ttl=255 time=0.371 ms
64 bytes from 192.168.1.107: icmp_seq=2 ttl=255 time=0.324 ms

--- 192.168.1.107 ping statistics ---
2 packets transmitted, 2 received, 0% packet loss, time 1032ms
rtt min/avg/max/mdev = 0.324/0.347/0.371/0.023 ms
```
