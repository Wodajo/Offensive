`server message block protocol` - make `file systems` and other resources (e.g. `printers`, `named pipes`, `APIs`) available to clients on the network

ports: 137, 138, 139 + 445

Networking stack:
- `TCP/IP` with adaptation layer for message boundaries notion - on `TCP/445`
or
- `NetBIOS` over `TCP/IP` (aka `NBT`)
	particulary:
	`NetBIOS-NS` (`name service`) - on `UDP/137` for broadcast and directed lookups of workstation, server and domain names
	`NetBIOS-DGM` (`datagram distribution service`) - on `UDP/138` for `error detection` and `recovery` of `connectionless` communication
	and
	`NetBIOS-SSN` (`session service`) - on **`TCP/139`** - for session management. "main" port in that setup
or rarely
- `NetBEUI` (`NetBIOS Extended User Interface`) - heavily rely on broadcasting - good only on small `LAN`s
or rarely
- `IPX/SPX` (`Internetwork Packet Exchange/Sequenced Packet Exchange`) - efficient on `LAN` bcos `SPX` use `negative-ACK`s instead of `congestion windows`, not build for `WAN`
	- `IPX` is a layer 3 OSI model protocol
	- `SPX` is a layer 4 of the OSI model protocol. The `SPX` layer sits on top of the `IPX` layer and provides connection-oriented services between two nodes on the network
	  `SPX` is used primarily by client-server applications


`smbclient //10.10.237.28/sharename -U username -p port`
to access share
default port is 138


```
PORT    STATE SERVICE
22/tcp  open  ssh
139/tcp open  netbios-ssn
445/tcp open  microsoft-ds
```
```
PORT    STATE         SERVICE
68/udp  open|filtered dhcpc
137/udp open          netbios-ns
138/udp open|filtered netbios-dgm
```