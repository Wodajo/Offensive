`ncat options hostname port`

### SSL
encrypt traffic with SSL

`ncat -C --ssl <server> 443`
`-C` use CRLF for EOL sequence
`--ssl` connect or listen with `SSL`
`TCP` as default, but can be `SCTP` with `--sctp` flag

#### client certificate
If `SSL server` require a `client certificate` for authentication -use the `--ssl-cert` and `--ssl-key` options to give the locations of `PEM`-encoded files containing the `certificate` and `private key`, respectively.
The certificate and key may be in the same file

#### server cert verification

`ncat -C --ssl-verify <server> 443`
`--ssl-verify` - require verification of the `certificate` and `matching of the domain name`.

by default client won't do any server certificate verification -> it will not be detected if the server has the wrong certificate / no certificate

### 