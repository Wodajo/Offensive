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


### resource utility
```bash
#!/usr/bin/env bash

# Program to output sys info page

TITLE="System Information Report For $HOSTNAME"  # constants in uppercase
CURRENT_TIME="$(date +"%x %r %Z")"
TIMESTAMP="Generated $CURRENT_TIME, by $USER"

report_uptime () {
	cat <<- _EOF_
		<h2>System Uptime</h2>
		<pre>$(uptime)</pre>
		_EOF_
return
}

report_disk_space () {
	cat <<- _EOF_
		<h2>Disc Space Utilization</h2>
		<pre>$(df -h)</pre>
		_EOF_
return
}

report_home_space () {
	if [[ "$(id -u)" -eq 0 ]]; then  # id -u outputs numeric UID of effective user. Always 0 for root
		cat <<- _EOF_
			<h2>Home Space Utilization (All Users)</h2>
			<pre>$(du -sh /home/*)</pre>
			_EOF_
	else
		cat <<- _EOF_
			<h2>Home Space Utilization ($User)</h2>
			<pre>$(du -sh $HOME)</pre>
			_EOF_
	fi

return
}

# in "here documents" single & double quotes lose their special meaning
# you can use command like netcat (e.g. send script text to command and retrieve some files)
# if <<- instead of << shell will ignore leading tab characters
cat << _EOF_
<html>
	<head>
		<title>$title</title>
	</head>
	<body>
		<h1>$title</h1>
		<p>$TIMESTAMP</p>
		$(report_uptime)
		$(report_disk_space)
		$(report_home_space)
	</body>
</html>
_EOF_

```
### expressions.sh
```bash
#!/usr/bin/env bash


# Lists the expressions used to evaluate    files
FILE=~/costam

if [ -e "$FILE" ]; then
	if [ -f "$FILE" ]; then
		echo "$FILE is a regular file."
	fi
	if [ -d "$FILE" ]; then
		echo "$FILE is a directory."
	fi
	if [ -r "$FILE" ]; then
		echo "$FILE is readible."
	fi
	if [ -w "$FILE" ]; then
		echo "$FILE is writable"
	fi
	if [ -x "$FILE" ]; then
		echo "$FILE is execuatble/searchable"
	fi
else
	echo "$FILE does not exist"
	exit 1
fi

# Lists the expressions used to evaluate    strings
$STRING="string-costam"


if [ $STRING ];then
	if [ -z $STRING ]; then
		echo "$STRING length == 0"
	fi
	if [ -n $STRING ]; then
		echo "$STRING length > 0"
	fi
	if [ $STRING == "string" ]; then
		echo "$STRING is \"string\""
	fi
	if [ $STRING != "string" ]; then
		echo "$STRING is not \"string\""
	fi
	if [ $STRING \> "string" ]; then  # > and < expressions must be escaped or shell wil interpret them as redirections. But still    WHAT IS THIS DOING??
		echo "$STRING sorts after \"string\""
	fi

else
	echo "$STRING is null"
fi

# Lists the expressions used to evaluate    integers
INT=-5

# Without using (( ))
if [[ "$INT" =~ ^-?[0-9]+$ ]];then  # regex checking if it's and integer, and if it's not empty
	
	if [ -z "$INT" ];then  # this check is useless due to above
		echo "$INT is empty" >&2
		exit 1
	fi
	if [ "$INT" -eq 3 ]; then   # -ne not equal, -le less than or equal, -lt less than, -ge greater equal, -gt greater than
		echo "$INT is equal 3"
	fi
	if [ "$INT" -eq 0 ]; then
		echo "$INT is zero"
	else
		if [ "$INT" -lt o ]; then
			echo "$INT is negative"
		else
			echo "$INT is positive"
		fi
		if [ $((INT % 2)) -eq 0 ]; then  # $(()) is a part of shell syntax (not an ordinary command) - recognize variables by name -  doesnt require expansion
			echo "$INT is even"
		else
			echo "$NIT is odd"
		fi
	fi
else
	echo "$INT is not an integer" >&2
	exit 1

fi

# Using (( ))
if [[ "$INT" =~ ^-?[0-9]+$ ]];then
	
	if ((INT == 0)) ;then   # (()) is a part of shell syntax - recognize variables by name -  doesnt require expansion

		echo "$INT is zero"
	else
		if ((INT < 0)); then
			echo "$INT is negative"
		else
			echo "$INT is positive"
		fi
		if (( ((INT % 2)) == 0)); then
			echo "$INT is even"
		else
			echo "$NIT is odd"
		fi
	fi
else
	echo "$INT is not an integer" >&2
	exit 1

fi


# Combining expressions  - test use -a, -o, !,   [[ ]] and (( )) use &&, ||, !

MIN_VAL=1
MAX_VAL=100
INT=50

MIN_VAL=1
MAX_VAL=100
INT=50

if [[ "$INT" =~ ^-?[0-9]+$ ]]; then
	if [[ ! ("$INT" -ge "$MIN_VAL" && "$INT" -le "$MAX_VAL") ]]; then
		echo "$INT is outside $MIN_VAL to $MAX_VAL."
	else
		echo "$INT is in range."
	fi
else
	echo "INT is not an integer." >&2
	exit 1
fi

if [ ! \( "$INT" -ge "$MIN_VAL" -a "$INT" -le "$MAX_VAL" \) ]; then  # expressions and operators treated as comman arguments by shell - characters with special meaning must be quoted/scaped
	echo "$INT is outside $MIN_VAL to $MAX_VAL."
else
	echo "$INT is in range."
fi


```
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