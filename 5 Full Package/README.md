# Full demo app 

This app deploys a complete, fully instrumented demo application into OpenShift. Tech stack includes:
- Java Application
- MySQL
- ActiveMQ
- Cache
- Java Mail
- AppD 4.5.0 agents

Ensure you have a v4.5 Controller running and available to the OpenShift cluster.

## Root access
We need to run these commands as root

```bash
sudo -s
```

## Create OpenShift Service Account

Ensure the cluster is running

```bash
oc cluster up --public-hostname=
```

In the OpenShift terminal window, type the following:

```bash
# Logs you in as the admin user
oc login -u system:admin

# Creates a Service Account that will be used by our application. This is needed for volume-mounting the agents and for the machine agent
oc create serviceaccount appd-agent
oc policy add-role-to-user view -z appd-agent

# Gives the service account elevated privileges
oc adm policy add-scc-to-user privileged -z appd-agent
```

## Create the configuration

Update the configMap.yaml file with the controller details

```yaml
apiVersion: v1
data:
  ACCOUNT_ACCESS_KEY: {Account Access Key}
  ACCOUNT_NAME: customer1
  APPLICATION_NAME: AD-DevOps
  APPLICATION_NAME_2: AD-DevOps-Offers
  CONTROLLER_HOST: {Controller URL}
  CONTROLLER_PORT: "8090"
  CONTROLLER_SSL_ENABLED: "false"
  JMS_LISTENER_QUEUE_NAME: JMS_LISTENER_QUEUE_NAME
  JMS_SENDER_QUEUE_NAME: JMS_SENDER_QUEUE_NAME
kind: ConfigMap
metadata:
  name: controller-config
```

Apply the configMap to the application:

Either through the GUI by importing the yaml file. Or...

```bash
oc create -f configMap.yaml
```

## Load the Docker images

Copy the offer.tar file up to the Openshift host. 

```bash
cd /openshift

# extract docker images from tar file
docker load < offers.tar
```

## Load the application into OpenShift

```bash
cd /openshift/configs
oc create -f web.yaml
oc create -f activemq.yaml
oc create -f availability-service.yaml
oc create -f core-services.yaml
oc create -f offer-service.yaml
oc create -f payment-service.yaml
oc create -f load.yaml
oc create -f machine-agent.yaml
```

# Version info

This lab weas tested on the following versions.

## Docker Version

```bash
docker version
Client:
 Version:         1.13.1
 API version:     1.26
 Package version: docker-1.13.1-63.git94f4240.el7.centos.x86_64
 Go version:      go1.9.4
 Git commit:      94f4240/1.13.1
 Built:           Fri May 18 15:44:33 2018
 OS/Arch:         linux/amd64

Server:
 Version:         1.13.1
 API version:     1.26 (minimum version 1.12)
 Package version: docker-1.13.1-63.git94f4240.el7.centos.x86_64
 Go version:      go1.9.4
 Git commit:      94f4240/1.13.1
 Built:           Fri May 18 15:44:33 2018
 OS/Arch:         linux/amd64
 Experimental:    false

```

## OpenShift Version
```bash
$ oc version
oc v3.10.0-rc.0+c20e215
kubernetes v1.10.0+b81c8f8
features: Basic-Auth GSSAPI Kerberos SPNEGO
```
