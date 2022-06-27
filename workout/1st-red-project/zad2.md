Hash types estimated with `hash-identifier`

9fd8301ac24fb88e65d9d7cd1dd1b1ec
MD5  
7f9a6871b86f40c330132c4fc42cda59
MD5  
6104df369888589d6dbea304b59a32d4
MD5  
276f8db0b86edaa7fc805516c852c889
MD5  
04dac8afe0ca501587bad66f6b5ce5ad
MD5  

7ab6888935567386376037e042524d27fc8a24ef87b1944449f6a0179991dbdbc481e98db4e70f6df0e04d1a69d8e7101d881379cf1966c992100389da7f3e9a
SHA512  
470c62e301c771f12d91a242efbd41c5e467cba7419c664f784dbc8a20820abaf6ed43e09b0cda994824f14425db3e6d525a7aafa5d093a6a5f6bf7e3ec25dfa
SHA512  

#### Dictionary hash cracking

All MD5 hashes passed into john with one file `MD5hashes`  

`john --format=Raw-MD5 --wordlist=/usr/share/wordlists/seclists/Passwords/Leaked-Databases/rockyou-50.txt ~/MD5hashes`
```
Using default input encoding: UTF-8
Loaded 5 password hashes with no different salts (Raw-MD5 [MD5 256/256 AVX2 8x3])
Warning: no OpenMP support for this hash type, consider --fork=2
Press 'q' or Ctrl-C to abort, almost any other key for status
butterfly        (?)     
tinkerbell       (?)     
blink182         (?)     
baseball         (?)     
hellokitty       (?)     
5g 0:00:00:00 DONE (2022-06-26 06:56) 500.0g/s 38400p/s 38400c/s 192000C/s 123456..jeffrey
Use the "--show --format=Raw-MD5" options to display all of the cracked passwords reliably
Session completed
```

All SHA512 hashes passed into john with `SHA512hashes`

`john --format=Raw-SHA512 --wordlist=/usr/share/wordlists/seclists/Passwords/Leaked-Databases/rockyou-50.txt ~/SHA512hashes`
```
Using default input encoding: UTF-8
Loaded 2 password hashes with no different salts (Raw-SHA512 [SHA512 256/256 AVX2 4x])
Warning: poor OpenMP scalability for this hash type, consider --fork=2
Will run 2 OpenMP threads
Press 'q' or Ctrl-C to abort, almost any other key for status
rockstar         (?)     
spiderman        (?)     
2g 0:00:00:00 DONE (2022-06-26 07:03) 100.0g/s 102400p/s 102400c/s 204800C/s 123456..steve
Use the "--show" option to display all of the cracked passwords reliably
Session completed.
```
