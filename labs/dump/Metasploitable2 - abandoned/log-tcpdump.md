`sudo tcpdump` -> `sudo dhclinet et0` (to ask dhcp for IP and discover dhcp server IP)
```
11:29:32.020533 IP 0.0.0.0.bootpc > 255.255.255.255.bootps: BOOTP/DHCP, Request from 08:00:27:50:4c:14 (oui Unknown), length 300
11:29:32.024706 IP 10.0.2.3.bootps > 255.255.255.255.bootpc: BOOTP/DHCP, Reply, length 548
11:29:32.074842 IP 10.0.2.4.43609 > 10.2.0.1.domain: 22811+ PTR? 255.255.255.255.in-addr.arpa. (46)
11:29:32.285158 IP 10.2.0.1.domain > 10.0.2.4.43609: 22811 NXDomain* 0/1/1 (269)
11:29:32.285368 IP 10.0.2.4.37274 > 10.2.0.1.domain: 60168+ PTR? 0.0.0.0.in-addr.arpa. (38)
11:29:32.335048 IP 10.2.0.1.domain > 10.0.2.4.37274: 60168 NXDomain* 0/1/1 (261)
11:29:32.335382 IP 10.0.2.4.51363 > 10.2.0.1.domain: 51570+ PTR? 3.2.0.10.in-addr.arpa. (39)
11:29:32.373523 IP 10.2.0.1.domain > 10.0.2.4.51363: 51570 NXDomain* 0/1/1 (262)
```
DHCP server IP: `10.0.2.3`