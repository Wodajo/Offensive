`-k`/`--insecure` -(TLS SFTP SCP) - skip the verification step.
By default, every secure connection curl makes is verified before transfer

`-i`/`--include` - (HTTP) - response headers in the output.
(e.g. server name, cookies, date of document, HTTP version...)
To view the request headers, consider the `--verbose` option

`-H`/`--header` -(HTTP) - extra header to include in the request. You may specify any number of extra headers
e.g.
`curl -H "X-First-Name: Joe" https://example.com`
`curl -H "User-Agent: yes-please/2000" https://example.com`
`curl -H "Host:" https://example.com`


`-d`/`--data` - (HTTP MQTT) - sends the specified data in a POST request.
If sth prepended with `@` it should be a file 
`curl -d @file https://example.com`
`curl -d "name=curl" -d "tool=cmdline" https://example.com`

`--data-raw` is almost the same but does not have a special interpretation of the `@` character

`--data-binary` to post data purely binary

`--data-urlencode` to URL-encode the value of a form field