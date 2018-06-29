# Deploy the web interface

## Build tag and push the docker images

`docker build .`

`docker tag <imageID> appddave/web:<version>`

`docker push appddave/web:<version>`

## Deploy the image onto the Openshift Cluster

`oc new-app appddave/web:latest`

`oc expose svc/web`

## Create a new config map fromt he file appd-configmap.yml

Update the values of this yml file

|Key|Description|
|--------------------------------|----------------------------------------------------------------|
|CONTROLLER_URL|AppD Controller URL (eg. 44controllerevents.appdynamics.com)|
|CONTROLLER_PORT|Controller port, typically 8090 for on prem controllers|
|CONTROLLER_ACCOUNT_NAME|Account Name from the License screen in the controller, typically customer1|
|CONTROLLER_ACCESS_KEY|Access Key from the license page|
|AGENT_VERSION|Your 4 digit controller version, for example: 4.4.3.0|
|APPD_APP_NAME| Name of the application, eg. SampleApp|
|APPD_TIER_NAME| Name of the tier, eg. Web|
|APPD_NODE_NAME| Name of the node eg. WebNode1. Note, this should be unique per pod|

Create the config map to the sample app and apply.

`oc create -f appd-configmap.yml`

`oc set env dc/web --from=configmap/appd-web-config`
