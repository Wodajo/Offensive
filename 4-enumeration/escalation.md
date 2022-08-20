horizontal - changing unprivileged access
vertical - gaining privileged access

##### accessing THM via openVPN
change to folder with conf. file -> `sudo openvpn thm.ovpn`

## Linux
`id; whoaimi; groups`
to check who I am

`ls -la /etc/passwd`
check your privileges (maybe you could write?)

`cat /etc/passwd | grep home | cut -d":" -F1`     
```
kali:x:1000:1000:Kali,,,:/home/kali:/usr/bin/zsh
```
users with `home` might be worthier of hacking
hash is in place of "x", or it is in `/etc/shadow`

check if you have access to `/etc/shadow` (not likely)

- look for `SUID` binaries
- look for `sudo` users