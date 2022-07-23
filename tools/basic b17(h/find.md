`find [where] [tests&operators]`
for actions - combine with `xargs`

### uses
### tests
(For files with `Access Control List` use `getfacl` program)

- `-perm MODE` (octal or symbolic)
`MODE` equally, `-MODE` all of these bits set, `/MODE` any
e.g. `find . -perm -g+w,u+w`

- `-nouser`, `-nogroup`, `-user NAME`, `-group NAME`
 `hostname`/`groupname` or `UID`/`GID`

- `-cmin n`
**content or attributes** changed `n` , `-n`, `+n` ago

- `-cnewer FILE`
match files or dirs which **content or attributes** was modified more recently than `FILE`

- `-newer FILE`
match files or dirs whose **contents** were modified more recently than `FILE
(usefull for shell scripts performing file backups - each time you make a backup update a log, and than use `find` to determine which files have changed since the last update)

- `-type`
`b` - block special device file
`c` - character special device file
`d` - directory
`f` - regular file
`l` - symbolic link
e.g. `find . -type d`

- `-size n`
 `n`  equally, `-n` less than, `+n` more than
`b` - 512-[byte] blocks (default)
`c` - [bytes]
`w` - 2-[byte] words
`k` - KiB [kibibytes] = 2^10 = 1024 [kB]
`M` - MiB [mebibytes] = 1024^2 [bytes]
`G` - GiB [gibibytes] = 1024^3 [bytes]
e.g. `find . -size +1M`

- `-name PATTERN` (shell wildcards)
"`PATTERN`" to avoid `pathname expansion`
`-iname` case insensitive

- `-regex PATTERN` (Emacs Regex by default)
  match **whole path**, not just search
  e.g. `find . .*bar.`
```
./fubar3
```
(`f.*r3` won't work)
`-iregex` case insensitive

### operators
`( )` group `tests` and `operators` together
means `subshells` for shells -> needs to be ecaped
`\( expression1 \) -o \( expression2 \)`


`-and` or `-a` implied by default
`-or` or `-o`
`-not` or `!`

e.g.
`find ~ \( -type f ! -perm 0600 \) -o \( -type d ! -perm 0700 \)
check if expression1 is true -> if expression is true - stops, if expression is false -> try expression 2

### funny names
file name can contain any character except `\0` (null) and `/`

`-print0` creates null-separated output
(if output is going to a terminal it **can be dangerous!**)
name can have i.a. `\n`
e.g.
`find . -iname "*.jpg" --print0 | xargs --null ls -la`
`xargs`'s `--null` (or `-0`) option accepts null-separated output

`-ls` unusual characters always escaped