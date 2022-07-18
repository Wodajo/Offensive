list and type from [0-hashes_to_crack](./0-hashes_to_crack)

`john --format=raw-md5 wordlist=/usr/share/wordlists/rockyou.txt 32_hex_digit_hashes`
```
Using default input encoding: UTF-8
Loaded 16 password hashes with no different salts (Raw-MD5 [MD5 256/256 AVX2 8x3])
Remaining 15 password hashes with no different salts
Warning: no OpenMP support for this hash type, consider --fork=2
Press 'q' or Ctrl-C to abort, almost any other key for status
richardl         (?)     
z08011993        (?)     
waswas81         (?)     
temoom           (?)     
taurusss         (?)     
taradog08        (?)     
nyles69          (?)     
nooknaja         (?)     
chariot15        (?)     
RIPYOHY          (?)     
Andres-Drek6♦hotmail.com (?)     
9143265794e      (?)     
216407miko       (?)     
13g 0:00:00:02 DONE (2022-07-17 18:53) 5.829g/s 6431Kp/s 6431Kc/s 49365KC/s  fuckyooh21..*7¡Vamos!
Use the "--show --format=Raw-MD5" options to display all of the cracked passwords reliably
Session completed.
```


`john --format=raw-sha256 wordlist=/usr/share/wordlists/rockyou.txt 64_hex_digit_hashes`
```
Using default input encoding: UTF-8
Loaded 10 password hashes with no different salts (Raw-SHA256 [SHA256 256/256 AVX2 8x])
Warning: poor OpenMP scalability for this hash type, consider --fork=2
Will run 2 OpenMP threads
Press Ctrl-C to abort, or send SIGUSR1 to john process for status
w2j47bn3         (?)     
taradog08        (?)     
steadii          (?)     
rhll0593star     (?)     
patterk23        (?)     
miamizi          (?)     
imfine22         (?)     
iluvpoo0         (?)     
ilovejasperhale  (?)     
ds14106          (?)     
10g 0:00:00:01 DONE (2022-07-17 18:54) 6.172g/s 5259Kp/s 5259Kc/s 34062KC/s duarte@1..dpkemo
Use the "--show --format=Raw-SHA256" options to display all of the cracked passwords reliably
Session completed.
```