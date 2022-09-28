`whoami` - username of current effective UID
`id` - UID, GID, groups
`ip a` - ip & MAC addresses assigned to all interfaces
`uname -a` - kernel, hostname, system and architecture info
`hostnamectl` - kernel, hostname, architecture, OS info (looks nicer than uname imo)
`ps aux` == `ps -ef` - print all processes on the system

to find out you shell:
`ps -p $$`
`-p` PID option, `$` returns the PID of current process (shell)

`find / -perm /u=s,g=s -type f 2> /dev/null`
`/u=s,g=s` any of these bits set -> find all files with `SUID` or `SGID`

#### Files
`/etc/hostname` - machine hostname
(identify machine in the network)

`/etc/shells` - available login shells

`/etc/*release` - basic OS info

`ls /etc/update-motd.d` - home for notes for building motd
`/etc/motd` - default motd file
(message of the day - displayed by `login` after a successful login but just before it executes the login shell)
-> could also be hidden in a shell rc file
