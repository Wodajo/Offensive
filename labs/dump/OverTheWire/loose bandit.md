#### bandit4
`bandit4@bandit:~/inhere$ ls | xargs awk '{print "./"$1}'`
```
./�/`2ғ�%��rL~5�g���
./��p,k�;��r*��
./e�)�#��5��
            ��p��V�_���ׯ�mm
./������h!TQO�`�4"aל�߂phT��,�A
?�i�4��ו$����I&�������c���ގ.�
./�r�l$�?h�9('���!y�e�#�x�O��=��
./ly���~��A�f����-E�{���m�����ܗM
./koReBOKuIDDepwhWk7jZC0RTdopnAYKh
./�T�?�i��j���îP�F�l�n��J����{��@
./�e�0$�in=��_b�5FA�P7sz��gNT
```
`xargs` passing files to `awk`

`bandit4@bandit:~/inhere$ ls | awk '{print "./"$1}'`
```
./-file00
./-file01
./-file02
./-file03
./-file04
./-file05
./-file06
./-file07
./-file08
./-file09
```
`pipe` sending a column to `awk`

therefore:
`bandit4@bandit:~/inhere$ ls | awk '{print "./"$1}' | xargs file`

OR

`ls -d $PWD/*` - display absolute path (for later)
`-d` only dirs. Necessary bcos otherwise ls will show contents of dirs in `$PWD`
e.g.
`ls -lad $PWD/*` - in `$PWD`, without - in dirs level deeper
`ls -lad $PWD/.*` - to view dotfiles
```
/home/bandit4/inhere/-file00  /home/bandit4/inhere/-file04  /home/bandit4/inhere/-file08
/home/bandit4/inhere/-file01  /home/bandit4/inhere/-file05  /home/bandit4/inhere/-file09
/home/bandit4/inhere/-file02  /home/bandit4/inhere/-file06
/home/bandit4/inhere/-file03  /home/bandit4/inhere/-file07
```

`ls ./*` (or simply `find .`)
```
./-file00  ./-file01  ./-file02  ./-file03  ./-file04  ./-file05  ./-file06  ./-file07  ./-file08  ./-file09
```

therefore:
`ls ./* | xargs file | grep ASCII | awk -F":" '{print $1}' | xargs cat`

#### bandit5
`find . \( -type f -size 1033c \) ! \( -perm /111 \) -print0 2> /dev/null | xargs -0 file | grep ASCII`

`find . -print0 | xargs -0 file` -> good thing

#### bandit 12

`xxd -r data.txt > data2`
`-r` reverse from (?????converse or patch?????) hexdump to binary

`file data2`
```
data.txt2: gzip compressed data, was "data2.bin", last modified: Thu May  7 18:14:30 2020, max compression, from Unix
```

`gzip` needs suffix to work properly! -> `mv data2 data2.gz`

`gzip -d data2.gz`

`file data2`
```
data2: bzip2 compressed data, block size = 900k
```

`bzip2 -d data2`

`file data2.out` - `.out` bcos `bzip2` append it if it can't guess original name
```
data2.out: gzip compressed data, was "data4.bin", last modified: Thu May  7 18:14:30 2020, max compression, from Unix
```

`mv data2 data2.gz`
`gzip -d data2.gz`

`file data2`
```
data2: POSIX tar archive (GNU)
```

`tar -xf data2`
`-x` extract archive
`-f` file/device archive name (here - `data2`)

`ls`
```
data2
data5.bin
data.txt
```
`data5.bin` - new file

...

#### bandit
