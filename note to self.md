Gods of Perseverance, Systematicness and Conscientiousness have me in your keep


- configure `DNS`, `DHCP`, `SMB`, `NFS` & `ssh` (end them when Jeremy materials) - that's a big one, I tell you what




check:
`sudo unicornscan -mU 192.168.1.0/24` (seems like `unicornscan` is not UDP scanning anything else than gateway and broadcast. `wireshark` filter `(udp) && (ip.src == 192.168.1.180)`


wierd:

What if I have many NIC? I can have many 192.168.1.0/24 networks. How does ssh know which one I'm mentioning?
Does 0.0.0.0 make every network accessable, or only networks on a specified NIC?

How to reverse shell while using vpn?
(resources can be made accessable with ngrok server)

why RDP (using xfreerdp) works fine between local administrator and user on virtual infrastructure (both accounts on same IP, Windows), but I have problems accessing user?