e.g. `cronie` package

enable `cronie.service`

`cronetabs` should be edited with `cronetab` program:

`crontab -l` - list existing `crontabs`
`crontab -e` - edit
if opens in other editor than you like:
`export EDITOR=vim` or directly `EDITOR=vim crontab -e`