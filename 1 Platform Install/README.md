# Platform Install

This can largely be ignored, this is some random notes on my lab setup.

## Centos 7
[Centos 7](http://mirror.aarnet.edu.au/pub/centos/7/isos/x86_64/CentOS-7-x86_64-Everything-1804.iso)

### Network
VirtualBox
Attached To: Bridged Network 
Name: eth0
Adapter: PCnet-fastIII

*Used Ravello instead of VBox*


### SSH

If the VM isn't on the network

Port forward port 2222 on the localhost to port 22 on the guest VM

ssh root@127.0.0.1 -p 2222


### Update and install prereqs
`su`

`yum update`

`reboot` - (if there is a kernal update)

`yum install git docker net-tools`


`git clone https://github.com/gshipley/installcentos.git`

### Install OpenShift

`vi /etc/hosts`

Add the current hostname and IP address

update `./installcentos/install-openshift.sh`

`export VERSION=${VERSION:="v3.9.0"}`

`service docker start`
