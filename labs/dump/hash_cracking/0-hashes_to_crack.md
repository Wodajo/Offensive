Passwords:
- [ ] 791981079ca8084570af9dd57dc7638d
- [ ] 1578155ca0c3e67949de6ee5a5815082
- [ ] bd0dd922a08a458115e29fbc3c54bbb4
- [ ] 22b0063e6290978714d0fd4247bd0c58
- [ ] 539234c3c11ebf2a30325b9e46be7c88
- [ ] 90694bf914a3af8dd7676ff1748cb049
- [ ] a7ccf05a4e555cfb7d47a823c335a2a4
- [ ] 03df0fab8c1f97f66f9c53f5242c2696
- [ ] 5e9d14006243b059e528ac682e855cfb
- [ ] 1258b403ac65914b934cda293490f9cb
- [ ] a5b76dcc6725b9288e4ecf209f9e0eb5
- [ ] b6037cf762fe3ecd72ea84d688f947ec
- [ ] 6b15adb78d99887d4739ecd774a21e19
- [ ] 8eba111d349c28c4bfdc888932ead71e
- [ ] 0c029661cd8d534c268e5f4a02624cc3
- [ ] e0746904b80ddfe1c3a39e959b5cef79

- [ ] 8591dd022eec1a90fbb44c4879f0e06fc82450cd7e0cbf3f5b41a4f1c3532330
- [ ] 53e5556f356e450963ebc6069f38d4cb4db8011067cbf6483322672f6c230ac9
- [ ] 533284be2de90cbdac8b08302343244b680162cc652f38beb6712636a420d9d0
- [ ] aa9221176ade915f1da04a87adfef4e22c615feac834561cee6468a17ddfe4a7
- [ ] af52711e934450dfe57234535d38707742e0e68cafe70e75cb4400d865ceea4a
- [ ] 938c1bfd530a84e6244d2e0bc60097dd23e5f6ad7423a1fe9481065fcba53b09
- [ ] c8761f171cff829318a62096d718b6e88f1507d048a4d63900aee4e56b650000
- [ ] 0d1e5783511bf5e86fa2ccfeca4dee11140f7b668d7ece1249f47592c25d3917
- [ ] 556cef7a0fe3b289a53494809096136e84f25449ab02e650ae4955cadab6d54f
- [ ] 4693342568bb194dd70874457059473dd9d6535934098860987795f8826a12d9
- [ ] c1885b9cf846ed7b60a5648f404a32e3da8b7a55629502eb8707aad810144cde
- [ ] 285aa715afe7932b03a98f6708e0df6cc511bcf69ad6c6acbc2da4ce56e7103d
- [ ] 9b1c7e2874978f0398570de746d7ade873791f48715bfef50aa53959764782d8
- [ ] 2c009a2fc0bc332df19b6a495485cac1e14e436678adb29f0cdd9b06bb79fdb7
- [ ] 84ca9773e6a2ce46845b956bb2b71f1a00614c977a6504afa98bedf440390652


#### Preparing:
copy everything above to file CRACKEM
`sed -i 's/- \[ \] //g' ~/CRACKEM` to get rid of this brackets

#### hash identification:
`hashid -j -m -o type_of_CRACKEM CRACKEM`
`-j` include john format, `-m` include hashcat mode

You might want to use `hash-identifier` for most likely type suggestion

`less type_of_CRACKEM`
hashes are mixed (at least with their lenght)

#### sort them by length to other files:
MD5 (128 bits  4 = 32 hex digits) represented with 32 hex digits [0-9a-f]
SHA-256 (256 bits => 64 hex digits)
SHA-512 (512 bits => 128 hex digits)

First let's separate hexadecimal notated hashes:
`egrep '^[0-9a-f]{32}$' CRACKEM > 32_hex_digit_hashes`
`egrep '^[0-9a-f]{64}$' CRACKEM > 64_hex_digit_hashes`
