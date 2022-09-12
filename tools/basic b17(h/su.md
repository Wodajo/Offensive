run commands with a substitute `UID` and `GID`

`-l`/`--login` - environment similar to a real login:
- clears all the `environment variables` EXCEPT `TERM` and variables specified by `--whitelist-environment`
- initializes the environment variables `HOME`, `SHELL`, `USER`, `LOGNAME`, and `PATH`
- changes to the target user's home directory
- sets `argv[0]` of the shell to `-` (in order to make the shell a `login shell`)

`-w`/`--whitelist-environment=list` - don't reset environment variables specified in comma separated list when clears environment for `--login`
the whitelist is ignored for the environment variables `HOME`, `SHELL`, `USER`, `LOGNAME`, and `PATH`


conifg files: `/etc/login.defs`, `/etc/default/su`