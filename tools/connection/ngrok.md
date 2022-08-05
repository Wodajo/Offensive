Enable connection to local resources via Internet

Windows is a pain in... many places

To send pictures to my friends I used kali VM:

`python3 -m http.server 9999"` to create server (in photos dir)
installed ngrok
`ngrok config add-authtoken TOKEN` to add the authtoken (without mail-based-account ngrok won't run)
`ngrok http 9999 --basic-auth 'USERNAME:PASSWORD'`