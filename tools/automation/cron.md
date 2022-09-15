e.g. `cronie` package (there are many flavours) -> enable `cronie.service`

`cronetabs` (cron-managing file) should be edited with `cronetab` program:

`crontab -l` - list existing `crontabs`
`crontab -e` - edit
if opens with in editor you don't like:
`export EDITOR=vim` or directly `EDITOR=vim crontab -e`

`MINUTE HOUR_OF_DAY MONTH DAY_OF_WEEK COMMAND`
_minute_ values can be from 0 to 59.
hour_ values can be from 0 to 23.
_day_of_month_ values can be from 1 to 31.
_month_ values can be from 1 to 12.
day_of_week_ values can be from 0 to 6, with 0 denoting Sunday.

`*` - every possible time interval
`,` - list multiple values separated by a comma
`-` - specify a range between two numbers
`/` - specify a periodicity/frequency

`*/5 9-16 * 1-5,9-12 1-5 ~/bin/i_love_cron.sh`
execute the script `i_love_cron.sh` at five minute intervals from 9 to 15:55 on working-days except during the months of June, July, and August.

[cronetab generator](https://crontab-generator.org/)

`@reboot` - at startup

`@yearly` or `@annually` - once a year

`@monthly` - once a month

`@weekly` - once a week

`@daily` or `@midnight` - once a day

`@hourly` - once an hour

`@reboot ~/bin/i_love_cron.sh`
execute the script `i_love_cron.sh` at startup