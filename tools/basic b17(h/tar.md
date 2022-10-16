`tar -cvf ARCHIVE FILES`
`-c` create, `-v` verbose, `-f` file (to pass newly created archive name)

`tar -zcvf ARCHIVE FILES`
`-z` pass archive through `gzip` -> `.tar.gz`

`tar -rvf ARCHIVE FILES`
`-r` append to archive


`tar -tf ARCHIVE` or `tar -ztf ARCHIVE`
`-t` list content of archive (`-z` for `.gz`)


`tar -xf ARCHIVE` optionally `FILES` (files to be extracted)
`-x` extract. (Should autodetect compression type if necessary)


For img -> tar for ODIN
```
$ tar -H ustar -c recovery.img > recovery.tar
$ md5sum -t recovery.tar >> recovery.tar
$ mv recovery.tar recovery.tar.md5
```