file transfer protocol

FTP usually operates using 2 channels:
- `command channel` aka `control channel`
- `data channel`

`active connection` - client opens a port and listens.
The server connect to it

`passive connection` - server opens a port and listens.
The client connects to it

Some legacy `ftpd` can issue command like `cwd` (change working dir) before authentication.
If account (user) is valid - ask for psswd.
If not - error message user invalid
-> User enumeration possibility