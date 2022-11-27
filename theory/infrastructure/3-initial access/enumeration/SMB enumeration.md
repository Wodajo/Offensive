`enum4linux-ng 192.168.1.1`
if no flags - **all** simple enumeration options assumed
`-oJ`/`-oY` - if `SIGINT` -> save current enumeration state to the `JSON` or `YAML` file

`msf6> auxiliary/scanner/smb/smb_version` - or other msf scanner




`smbclient -L //10.10.237.28/` ? - list shares    TEST ME
`smbclient //10.10.237.28/sharename -U username -p port` - access share
default port is 138 (sure it's not 139???)