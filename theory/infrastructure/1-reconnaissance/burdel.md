Open-source intelligence

##### Recon-ng


##### testing of RCE
encode payload (e.g. in `base64`) - output shouldn't have any troublesome characters. That way we don't have to worry about payload encoding by Target
`echo 'payload in base 64' | base64 -d | sh`


#### xml external entity
```
<somexml><message>Hello World</message></somexml>
```
