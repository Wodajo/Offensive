GUI for using `Sharphound` as input to visualise it into attack paths

uses `Neo4j` as its `backend database` and `graphing system`
(`Neo4j` is a graph database management system)

`Sharphound` is a tool for AD enumeration (aka `collector`)
There are other collectors like `AzureHound.ps1` for `Azure` enumeration
run `SharpHound` on targeted Windows
`.\SharpHound.exe --CollectionMethods All --Domain za.tryhackme.com --ExcludeDCs`
Awfully noisy, but you can plan you next attack easier now

move created zip to Kali, e.g.
`scp AD_USERNAME@THMJMP1.za.tryhackme.com:C:/Users/AD_USERNAME/Documents/<Sharphound ZIP> .`

`sudo pacman -S bloodhound` - blackarch install neo4j as dependency (nicely done)
`sudo systemctl start neo4j` - this might be wrong (I did this, and than `neo4j` start - seems redundant but I'm not sure)
`sudo neo4j start`
`http://localhost:7474` - browser interface