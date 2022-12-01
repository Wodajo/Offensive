`export PATH=~/bin:"$PATH"` - add to `.bashrc`
`. .bashrc` - `.` is a synonim for `source` command - shell builtin reading specified file of shell commands and treats it like input from the keyboard


### variables
be carefull - shell **create variables when it encounter it**
	- if you mispell a variable it will be created -> pathway expansion of that (empty) variable can play havoc
	- you can enforce declaring with a `declare -r VARIABLE="VALUE"`
	  `r` - read-only - prevents subsequent assignment to VARIABLE
	  `i` - restrict assignment to integers

```
`myDir='/home/kali/`  # no spaces around =
a=z  # assign string "z"
b="a string"  # spaces must be within quotes
c="a string and $b"  # other expansions (such as variables) can be expanded into assignment
d="$(ls -la foo.txt)"  # results of a command
e=$((5*7))  # arithmetic expansion
f="\t\ta string\n"  # escape sequences such as tabs and newlines
```

```
filename="new.sh"
touch "$filename"
mv "$filename" "${filename}1"
```
double-quotes enclosing variables - good practice (prevents word-splitting by shell)
qurly-quotes enclosing variables - tells the shell to expand whatever is inside - usefull when variable name become ambigous in surrounding context
	`cd_var=$(cd ${myDir})`

##### local variables
only accessible within shell function in which they are defined
```
funct_1 () {
local foo    # variable foo local to funct_1
foo=1
echo "funt_1: foo = $foo"
}
```

### basics
`#!/usr/bin/env bash` - should find ENV for bash and run it
	- more universal than depending on linking bash to `/bin/bash` - while it's usually in `/usr/bin/bash`
	- `#!/usr/bin/env -vS bash` - debug mode
	  `#!/usr/bin/bash -x` - also debug mode

$0, $1, $2, $3 - scriptname, arg1, arg2, arg3
	e.g. `new.sh 192 -t`  - $0 new.sh, $1 192, $2 -t
	`$@` - all arguments in numerical order
	`$?` - exit code
`exit 1` - exit code to e.g. 1 (aka false, used i.a. by `if`)

file descriptor `0` - stdin, `1` - stdout, `2` - stderr
`>&2` - write to fd 2
`2>`- redirection of stderr
`&>` - redirection of stdout&stderr
`3>` - redirection of custom file descriptor `3`


### tests
```
[ expression ] - regular test
e.g.
if [ $STRING ]; then
echo "$STRING is not null"
fi

[[ expression ]] - test allowing use of `=~` for regex matching
(returns true if match)
and use of == with pattern matching like in pathway expansion
e.g.
if [[ "$INT" =~ -?[0-9]+S ]]; then
echo "$INT value is limited to numerals with optional leading minus sign"
else
echo "$INT value is not an integer"
if [[ $FILE == foo.* ]];then
echo " $FILE matches pattern 'foo.*'"
fi

(( )) - for integers. Support arithmetic evaluations & return true/false
e.g.
INT=-5
```

### combining expressions
tests - `-a`, `-o`, `!`
`[[ ]]` and `(( ))` - `&&`, `||`, `!`

```

```

### here document 
I/O redirection in which we embed a body of text into our script and feed it into the stdin of a command
single&double quotes lose their special meaning
```
command << token
text
token
```

e.g.
```
$ foo="some text"
$ cat << _EOF_
> $foo
> "$foo"
> '$foo'
> _EOF_
some text
"some text"
'some text'
$foo
```

### functions
```
function Hello_there {
echo "Hellow there!"
return              # termiantes function. CAN RETURN EXIT CODES (e.g. return 1)
}
```
or
```
Hello_there () {
echo "Hellow there!"
return
}
```

usage:
```
echo "next line is a function"
Hello_there
echo "You're a bold one, General Kenobi"
```
remember that function must appear before it is called


### style conventions

uppercase for constans
lowercase for variables


### ping sweep

```shell
#!/bin/bash

if [ "$1" == "" ]
then
echo "You forgot IP address"
echo "Syntax: ./ipsweep.sh 192.168.4"

else
for ip in `seq 1 254`; do
ping -c 2 $1.$ip | grep "64 bytes" | cut -d " " -f 4 | tr -d ":" & 
# $1 means first argument passed to that script (e.g. ./ipsweep 192.168.4)
# & allow multiple instances of loop to run at once. It could be ; if you want BUT there won't be next loop iteratioan until previous one finish
# remember that this only sends requests (no timeout management)
done
fi
```

`./ipsweep 192.168.1 > ipsweep.txt`

`for ip in $(cat ipsweep.txt); do nmap $ip & done` - you can use `;` instead of `&` (as in script)


### web enumeration

```shell
#!/bin/bash

url=$1

if [ ! -d "$url" ]; then
mkdir $url
fi
if [ ! -d "$url/recon" ]; then
mkdir $url/recon
fi

echo "Harvesting subdomains with assetfindeer..."
assetfinder $url >> $url/recon/assets.txt  # also related subdomains (maybe out of scope)
cat $url/recon/assets.txt | grep $1 >>$url/recon/final.txt  # extract what is truly needed
rm $url/recon/assets.txt

echo "Harvesting subdomains with amass..."
amass enum -d $url >> $url/recon/f.txt
sort -u $url/recon/f.txt >> $url/recon/final.txt  # output only unique
rm $url/recon/f.txt

echo "Probing for alive domains..."
cat $url/recon/final.txt | sort -u | httprobe -s -p https:443 | sed s_https\?\/\/// | tr -d ':443' >> $url/recon/alive.txt  # check for answer only on 443 HTTPS servers, sed and tr for clean output

```