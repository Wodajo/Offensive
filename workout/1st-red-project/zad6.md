Configuration of `/etc/vsftp.conf` on server side  

![So that sending files wifh ftp could be possible](./img/ftp-1.png)

Sniff `eth0` interface on Kali VM with `wireshark`-> open `ftp` connection with other VM -> send passwords in plain text file using `ftp` -> try to find passwords in `wireshark` logs  (filtr `ftp-data`)  

Sending from Kali (`put`):
![put](./img/ftp-put.png)

Downloading (`get`):
![get](./img/ftp-get.png)

`wireshark`

![Unencrypted af](./img/ftp-wire1.png)

![Unencrypted af](./img/ftp-wire2.png)

![Unencrypted af](./img/ftp-wire.png)


