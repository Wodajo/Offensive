Hash types estimated with `hash-identifier`

#### Bruteforce hash cracking

81dc9bdb52d04dc20036dbd8313ed055
MD5
1. `hashcat -a 3 -m 0 81dc9bdb52d04dc20036dbd8313ed055`
2. `hashcat -a 3 -m 0 81dc9bdb52d04dc20036dbd8313ed055 --show`
```
81dc9bdb52d04dc20036dbd8313ed055:1234
```


b021d0862bc76b0995927902ec697d97b5080341a53cd90b780f50fd5886f4160bbb9d4a573b76c23004c9b3a44ac95cfde45399e3357d1f651b556dfbd0d58f
SHA256 or Whirlpool
1. `hashcat -m 1700 -a 3 hash2.hash --increment --increment-min 1 --increment-max 5 ?d?d?d?d?d -o craked2.txt`
Using `-u` seems not reliable. `--show` after cracking works better for me  
Mask is known bcos of [CrackStation](https://crackstation.net/) lookup
```
b021d0862bc76b0995927902ec697d97b5080341a53cd90b780f50fd5886f4160bbb9d4a573b76c23004c9b3a44ac95cfde45399e3357d1f651b556dfbd0d58f:6969
```


7aaa0f57
ADLER-32 lub CRC-32B  
**Whats up with the zeros? How many should I append?**  
1. `hashcat -a 3 -m 11500 7aaa0f57:00000000 --increment --increment-min 1 --increment-max 5 ?d?d?d?d?d`
2. `hashcat -a 3 -m 11500 7aaa0f57:00000000 --increment --increment-min 1 --increment-max 5 ?d?d?d?d?d --show`
```
7aaa0f57:00000000:2022
```


31bca02094eb78126a517b206a88c73cfa9ec6f704c7030d18212cace820f025f00bf0ea68dbf3f3a5436ca63b53bf7bf80ad8d5de7d8359d0b7fed9dbc3ab99 - SHA-512 or Whirlpool
1. `hashcat -a 3 -m 1700 31bca02094eb78126a517b206a88c73cfa9ec6f704c7030d18212cace820f025f00bf0ea68dbf3f3a5436ca63b53bf7bf80ad8d5de7d8359d0b7fed9dbc3ab99 --increment --increment-min 1 --increment-max 5 ?d?d?d?d?d`
2. `hashcat -a 3 -m 1700 31bca02094eb78126a517b206a88c73cfa9ec6f704c7030d18212cace820f025f00bf0ea68dbf3f3a5436ca63b53bf7bf80ad8d5de7d8359d0b7fed9dbc3ab99 --increment --increment-min 1 --increment-max 5 ?d?d?d?d?d --show`
```
31bca02094eb78126a517b206a88c73cfa9ec6f704c7030d18212cace820f025f00bf0ea68dbf3f3a5436ca63b53bf7bf80ad8d5de7d8359d0b7fed9dbc3ab99:0
```


9e66d646cfb6c84d06a42ee1975ffaae90352bd016da18f51721e2042d9067dcb120accc574105b43139b6c9c887dda8202eff20cc4b98bad7b3be1e471b3aa5
SHA-512 or Whirpool
1.  `hashcat -a 3 -m 1700 9e66d646cfb6c84d06a42ee1975ffaae90352bd016da18f51721e2042d9067dcb120accc574105b43139b6c9c887dda8202eff20cc4b98bad7b3be1e471b3aa5`
2. `hashcat -a 3 -m 1700 9e66d646cfb6c84d06a42ee1975ffaae90352bd016da18f51721e2042d9067dcb120accc574105b43139b6c9c887dda8202eff20cc4b98bad7b3be1e471b3aa5 --show`
```
9e66d646cfb6c84d06a42ee1975ffaae90352bd016da18f51721e2042d9067dcb120accc574105b43139b6c9c887dda8202eff20cc4b98bad7b3be1e471b3aa5:sda
```


8a04bd2d079ee38f1af784317c4e2442625518780ccff3213feb2e207d2be42ca0760fd8476184a004b71bcb5841db5cd0a546b9b8870f1cafee57991077c4a9
SHA-512 or Whirpool
1. `hashcat -a 3 -m 1700 8a04bd2d079ee38f1af784317c4e2442625518780ccff3213feb2e207d2be42ca0760fd8476184a004b71bcb5841db5cd0a546b9b8870f1cafee57991077c4a9`
2. `hashcat -a 3 -m 1700 8a04bd2d079ee38f1af784317c4e2442625518780ccff3213feb2e207d2be42ca0760fd8476184a004b71bcb5841db5cd0a546b9b8870f1cafee57991077c4a9 --show`
```
8a04bd2d079ee38f1af784317c4e2442625518780ccff3213feb2e207d2be42ca0760fd8476184a004b71bcb5841db5cd0a546b9b8870f1cafee57991077c4a9:Asia
```


44d9886c0a57ddbfdb31aa936bd498bf2ab70f741ee47047851e768db953fc4e43f92be953e205a3d1b3ab752ed90379444b651b582b0bc209a739a624e109da
SHA-512 or Whirpool
1. `hashcat -a 3 -m 1700 44d9886c0a57ddbfdb31aa936bd498bf2ab70f741ee47047851e768db953fc4e43f92be953e205a3d1b3ab752ed90379444b651b582b0bc209a739a624e109da --increment --increment-min 6 --increment-max 6 -1 ?l?u?d ?1?1?1?1?1?1`  
`-1` custom charset. Password should have had 6 alphanumeric characters. That was not true.
2. `hashcat -a 3 -m 1700 44d9886c0a57ddbfdb31aa936bd498bf2ab70f741ee47047851e768db953fc4e43f92be953e205a3d1b3ab752ed90379444b651b582b0bc209a739a624e109da --increment --increment-min 6 --increment-max 6 ?a?a?a?a?a?a`
3. `hashcat -a 3 -m 1700 44d9886c0a57ddbfdb31aa936bd498bf2ab70f741ee47047851e768db953fc4e43f92be953e205a3d1b3ab752ed90379444b651b582b0bc209a739a624e109da --increment --increment-min 6 --increment-max 6 ?a?a?a?a?a?a --show`  
```
44d9886c0a57ddbfdb31aa936bd498bf2ab70f741ee47047851e768db953fc4e43f92be953e205a3d1b3ab752ed90379444b651b582b0bc209a739a624e109da:T0^^3k
```
