# Platform Install

## Centos 7
[Centos 7](http://mirror.aarnet.edu.au/pub/centos/7/isos/x86_64/CentOS-7-x86_64-Everything-1804.iso)

## OS Setup
 
root/toor 

### Network
VirtualBox
Attached To: NAT Network
Name: BorgNetwork
Adapter: PCnet-fastIII

### SSH
Enable SSH:
/etc/ssh/sshd_config

`PermitRootLogin yes`

`service sshd restart`

### SSH
Port forward port 2222 on the localhost to port 22 on the guest VM

ssh root@127.0.0.1 -p 2222


### Update and install prereqs

`yum update`
`yum install git docker net-tools`


`git clone https://github.com/gshipley/installcentos.git`

### Install OpenShift

update `./installcentos/install-openshift.sh`
`export VERSION=${VERSION:="v3.6.1"}`


