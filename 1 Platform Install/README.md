# Platform Install

## Centos 7
[Centos 7](http://mirror.aarnet.edu.au/pub/centos/7/isos/x86_64/CentOS-7-x86_64-Everything-1804.iso)

## OS Setup
 
root/toor 

### Network
VirtualBox
Attached To: Host-only Adapter
Name: vboxnet0 
Adapter: PCnet-fastIII

**Enable the network interface**
Interface config setting:
/etc/sysconfig/network-scripts/ifcfg-enp0s3

Set:
`ONBOOT=yes`

### SSH
Enable SSH:
/etc/ssh/sshd_config

`PermitRootLogin yes`

`service sshd restart`
