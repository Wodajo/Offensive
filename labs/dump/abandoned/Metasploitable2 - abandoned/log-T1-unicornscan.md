`sudo unicornscan -mU 10.0.2.5 | awk '{print "T1-"$4"-udp-"$3}' | sed -e 's/\[//g;s/\]//g'`
```
T1-53-udp-domain
T1-111-udp-sunrpc
T1-137-udp-netbios-ns
T1-2049-udp-shilp
T1-from-udp-unknown41163
```