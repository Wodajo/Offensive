wrapper around the Samba tools `nmblookup`, `net`, `rpcclient`
and `smbclient`


`enum4linux-ng 192.168.1.1`
if no flags - **all** simple enumeration options assumed


`-oJ`/`-oY` - if `SIGINT` -> save current enumeration state to the `JSON` or `YAML` file

`-U` get users (via `RPC` - remote procedure code)
`-S` get shares (via `RPC`)