reads from `stdin`/`files` to `X selection` for pasting into `X applications` 
(in Windows Subsystem for Linux (WSL) use `clip.exe` to copy to Windows clipboard)

as long as options are unambiguous - can be abbreviated
`xclip -sel clip` == `xclip -selection clipboard`

there are 3 `X selections` - `primary` (default, middle-click), `secondary` and `clipboard` (ctr+shift+c)

`ls | xclip` -> `xclip -o`
copy `stdin` to `primary Xselection` -> passes `primary Xselection` to `stdout`

`xclip -sel clip -r`
`-r` to remove trailin \n (for terminal pasting safety)