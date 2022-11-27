##### nmap

NSE `find / -name '*.nse' 2> /dev/nul` find folder with .nse scripts than `ls | grep enum`  
e.g. `--script=mysql-enum`, `--script-help mysql-enum` ,`--script "smb-enum-*"` 

Windows/Samba: [enum4linux-ng](https://github.com/cddmp/enum4linux-ng)  

`msf6> search aux enum`