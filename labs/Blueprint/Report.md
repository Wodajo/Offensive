It's a rough, not really thinked-through sketch of reasonable report. Professional report (with `severity ratings` and highest-possible-reference) after you know what you're doing, and learn more form NIST guidelines
## Penetration Test Report
of Corpo
2022-09-22

Who-am-i
Contact info
### Table of contents:
FIND A WAY TO MAKE IT HYPERLINKS IN PDF
Maybe other tool to which you'd copy notes?

Exective summary
Summary of results
Attack narrative
Conclusion
Recommendations
Risk rating
Appendix A - Vulnerability detail & mitigation
### executive summary
aka **management summary** - short document/section of a document produced forbuissnes purposes.
It summarizes a longer report (or proposal or a group of related reports) in such a way that readers can rapidly become acquainted with a large body of material

e.g.
```
I was contracted by Corpo to conduct a penetration test in order to determine its exposure to a targeted attack. All activities were conducted in a manner that simulated a
malicious actor engaged in a targeted attack against Corpo with the goals of:
- Identifying if a remote attacker could penetrate Corpo's defenses
- Determining the impact of a security breach on:
	- Confidentiality of the company’s private data
	- Internal infrastructure and availability of Corpo's information systems
  
Efforts were placed on the identification and exploitation of security weaknesses that could allow a remote attacker to gain unauthorized access to organizational data.
The attacks were conducted with the level of access that a general Internet user would have.

The assessment was conducted in accordance with the recommendations outlined in NIST SP 800-115 with all tests and actions being conducted under controlled conditions.
```

### summary of results
e.g.
```
Initial reconnaissance of the Corpo's network resulted in the discovery of a misconfigured DNS server that allowed a DNS zone transfer. The results provided us with a listing of specific hosts to target for this assessment. An examination of these hosts revealed a password-protected administrative webserver interface. After creating a custom wordlist using terms identified on the Corpo's
website we were able to gain access to this interface by uncovering the password via brute-force.
```

### Attack narrative
#### Webmin compromise
How I exploited Webmin. What I gained from this
#### RCE
How I get RCE. How bad it is. Maybe I gained info about network. I could make a network-graph with new vectors of attack
#### Firewall bypass
And so on...

### Conclusion
e.g.
```
Corpo suffered a series of control failures, which led to a complete compromise of critical company assets. These failures would have had a dramatic effect on Corpo's operations if a malicious party had exploited them. Current policies concerning password reuse and deployed access
controls are not adequate to mitigate the impact of the discovered vulnerabilities.

The specific goals of the penetration test were stated as:
- Identifying if a remote attacker could penetrate MegaCorp One’s defenses
- Determining the impact of a security breach on:
	- Confidentiality of the company’s information
	- Internal infrastructure and availability of MegaCorp One’s information systems
 
These goals of the penetration test were met. A targeted attack against MegaCorp One can result in a complete compromise of organizational assets. Multiple issues that would typically be considered minor were leveraged in concert, resulting in a total compromise of the MegaCorp One’s information systems.

It is important to note that this collapse of the entire Corpo's security infrastructure can be greatly attributed to insufficient access controls at both the network boundary and host levels.
```

### Recommendations
e.g.
```
Due to the impact to the overall organization as uncovered by this penetration test, appropriate
resources should be allocated to ensure that remediation efforts are accomplished in a timely manner.
While a comprehensive list of items that should be implemented is beyond the scope of this
engagement, some high level items are important to mention.

1. Ensure stron passwors - explanaition
2. Establish trust boundries - explanaiton with e.g. suggesiton of network segmentation
3. conduct regular vulnerability assasments
```

### Risk rating
overall risk for infrastructure

### Appendix A - Vulnerability detail & mitigation
`THIS IS LAST (NOT WITH ATTACK NARRATIVE) BCOS I WANT THIS RAPPORT TO BE EASILY READABLE - risk ratings of minor "steps" are ment to be here`

#### Risk Rating Scale
e.g.
```
In accordance with NIST SP 800-30, exploited vulnerabilities are ranked based upon likelihood and impact to determine overall risk.
```

##### Default or Weak Credentials
e.g.
```
Rating: High

Description: An externally exposed administrative interface is only protected with a weak
password.

Impact: Using common enumeration and brute-forcing techniques, it is possible to retrieve the administrative password for the SQLite Manager web interface. Due to the lack of any additional authentication mechanisms, it is also possible to retrieve all user password hashes in the underlying database. Successful retrieval of plaintext passwords could allow further compromise of the target environment if password reuse is found to exist.

Remediation: Ensure that all administrative interfaces are protected with complex passwords or passphrases. Avoid use of common or business related words, which could be found or easily constructed with the help of a dictionary.
```

****
sources:
[Offensive Security report sample](https://www.offensive-security.com/reports/sample-penetration-testing-report.pdf)
[Guide to Information Security Testing and Assessment (NIST Special Publication 800-115)](https://www.nist.gov/privacy-framework/nist-sp-800-115)

[CVSS reference](https://nvd.nist.gov/vuln-metrics/cvss)