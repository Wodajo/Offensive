Configuration of `/etc/vsftp.conf` on server side  

![So that sending files wifh ftp could be possible](ftp-1.png)

Sniff `eth0` interface on Kali VM with `wireshark`-> open `ftp` connection with other VM -> send passwords in plain text file using `ftp` -> try to find passwords in `wireshark` logs  (filtr `ftp-data`)  

Sending from Kali (`put`):
![put](ftp-put.png)

Downloading (`get`):
![get](ftp-get.png)

`wireshark` analysis

![Unencrypted af](ftp-wire1.png)

![Unencrypted af](ftp-wire2.png)

![Unencrypted af](ftp-wire.png)


