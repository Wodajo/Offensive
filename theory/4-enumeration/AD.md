Umbrella title (central system) for broad range of directory-like identity-related services i.a. `network authentication`, `resource management` and `digital policy enforcement`

Uses `LDAP` (`lightweight directory access protocol`), `Kerberos` and `DNS`

AD Services:
- `AD DS` (`Active Directory Domain Services`) -  stores information about members of the domain (including devices and users), verifies their credentials (authentication), and defines their access rights (authorization)
  The server running this service is called a `domain controller`
  `domain controller` is contacted when a user logs into a device, accesses another device across the network or transfer files in LAN using line-of-buissness app
`AD` services use `AD DS` (EXCLUDING `AD LDS`) i.a. `Group policy`, `Encrypting File System`, `BitLocker`, `DNS`, `RDP`, `Exchange Server`, `SharePoint Server`

- `AD LDS` (`Active Directory Lightweight Directory Services`) - implementation of the `LDAP` protocol for `AD DS`
  `AD LDS` runs as a service on `Windows Server`
  AD LDS shares the code base with AD DS and provides the same functionality, including an identical [API](https://en.wikipedia.org/wiki/API "API"), but does not require the creation of domains or domain controllers. It provides a _Data Store_ for the storage of directory data and a _[Directory Service](https://en.wikipedia.org/wiki/Directory_(database) "Directory (database)")_ with an LDAP _Directory Service Interface_. Unlike AD DS, however, multiple AD LDS instances can run on the same server.



##### Kerberos
[thm room](https://tryhackme.com/room/attackingkerberos)

`Ticket Granting Ticket` (`TGT`) - A ticket-granting ticket is an authentication ticket used to request service tickets from the TGS for specific resources from the domain

`Key Distribution Center` (`KDC`) - The Key Distribution Center is a service for issuing TGTs and service tickets that consist of the Authentication Service and the Ticket Granting Service
  
`Authentication Service` (`AS`) - The Authentication Service issues TGTs to be used by the TGS in the domain to request access to other machines and service tickets
  
`Ticket Granting Service` (`TGS`) - The Ticket Granting Service takes the TGT and returns a ticket to a machine on the domain
  
`Service Principal Name` (`SPN`) - A Service Principal Name is an identifier given to a service instance to associate a service instance with a domain service account. Windows requires that services have a domain service account which is why a service needs an SPN set
  
`KDC Long Term Secret Key` (`KDC LT Key`) - The KDC key is based on the KRBTGT service account. It is used to encrypt the TGT and sign the PAC
  
`Client Long Term Secret Key` (`Client LT Key`) - The client key is based on the computer or service account. It is used to check the encrypted timestamp and encrypt the session key
  
`Service Long Term Secret Key` (`Service LT Key`) - The service key is based on the service account. It is used to encrypt the service portion of the service ticket and sign the PAC
  
`Session Key` - Issued by the KDC when a TGT is issued. The user will provide the session key to the KDC along with the TGT when requesting a service ticket
  
`Privilege Attribute Certificate` (`PAC`) - The PAC holds all of the user's relevant information, it is sent along with the TGT to the KDC to be signed by the Target LT Key and the KDC LT Key in order to validate the user

