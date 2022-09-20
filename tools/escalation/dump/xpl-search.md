SADLY - can't get it to run (very old depedencies)

(`/usr/bin` is in path, so you can use this tool directly)

`/usr/bin/xpl-search -s "name to search"`

`--set-db` - Select which database(s) will be used, using the id's
           0 - ALL (DEFAULT)
           1 - Exploit-DB
           2 - Milw00rm
           3 - PacketStormSecurity
           4 - IntelligentExploit
           5 - IEDB
           6 - CVE
           7 - Siph0n
`xpl-search --set-db 1,3,6`

`xpl-search --cve-id 2015-0349`
`--cve-id `-  description and link to the `CVE`


`xpl-search --save-dir=/opt/`
`--save-dir` - sets the directory for saving files.

`xpl-search --save`
`xpl-search --save=/opt/`
`--save` - save the exploits found by the tool.
You can point in which dir

`xpl-search --save-log`
`xpl-search --save-log=/opt/`
`--save-log` - saves log of search in the current dir.
You can point in which dir


### Misc
`--theme` - command to change the color palette of the tool.
           Default - Colors used since version 0.2
           greenworld - "Green World" As its name suggests, this theme is focused on green.
           vsdark - "Blue and Yellow"
           wab - "Blue and Red"
`/usr/bin/xpl-search --theme=vsdark`