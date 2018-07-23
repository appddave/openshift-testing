# initContainer Example

This is a recommended method of injecting an agent into a launching container.

We use the initContainer feature of an OpenShift pod to copy the agent binaries into the container. We also ensure the agent is configurable at runtime using configMaps.

This ensures we can upgrade, and configure the agent as required without having to rebuild the application containers.

## Create the configMap

Update the controller details in the configMap.yaml file and create the configMap:

```
oc create -f configMap.yaml
```

## Prepare the InitContainer

Build the image using the Dockerfile in the /initContainer directory

```
docker build -t {your docker un}/agent-repo:4.5
```

You will need to [download the agent](https://download.appdynamics.com/), and update paths and version numbers to match.

Push the image to your repo

```
docker push {your docker un}/agent-repo:4.5
```

## Create the service

I've used the vanilla Tomcat image from the docker repo. It doesn't start an application, but simply shows how the container is created and the agent is copied across.

### Create a service account

In the OpenShift terminal window, type the following:
```
# Logs you in as the admin user
oc login -u system:admin

# Creates a Service Account that will be used by our application. This is needed for volume-mounting the agents and for the machine agent
oc create serviceaccount appd-agent
oc policy add-role-to-user view -z appd-agent

# Gives the service account elevated privileges
oc adm policy add-scc-to-user privileged -z appd-agent
```

### Deploy the tomcat service 

Update the yaml file with the correct paths and versions

Deploy the service

```
oc create -f tomcat-service.yaml 
```

You should the the pod come up, with the agent files extracted into the /appdynamics folder
