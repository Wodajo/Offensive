`Simple Mail Transfer Protocol`
push protocol

- verify with DNS `SPF record` (`Sender Policy Framework`) - contain IPs of `email servers` and `domains` that are allowed to send emails
- sends the outgoing mail (push)
- if the outgoing mail can't be delivered - sends the `NDN message` (non-delivery notification) back to the sender

internal commands usefull for enumeration:
`VRFY` - confirming the names of valid users
`EXPN` - reveals mailing lists and actual address of user’s aliases
e.g. use `NSE` `smtp_enum_users` - enumerate users on a `SMTP` server by issuing the `VRFY`, `EXPN` or `RCPT` commands.
So as to discover all the user accounts in the remote system

`Mail Transfer Agent` (MTA) - aka mail server


`Post Office Protocol` - more simplistic approach of downloading the inbox from the mail server than `IMAP`

`Internet Message Access Protocol` - synchronise current inbox with new mail on the server, downloading anything new
Thus changes to inbox persist if you synchronise it from another computer

(you can also pull mails with `HTTP`)