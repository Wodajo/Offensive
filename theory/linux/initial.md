`/etc/hostname` - machine hostname
(name to identify machine in the network)

`/etc/shells` - available login shells

`find / -perm /u=s,g=s -type f 2> /dev/null`
`/u=s,g=s` any of these bits set -> find all files with `SUID` or `SGID`

