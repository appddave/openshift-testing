# Openshift Testing

This repository collects various resources related to monitoring applications deployed in OpenShift with AppDynamics.

This is not intended as a tutorial. It is simply a collection of Docker build files, Openshift commands and various deployment concepts.

Description of each of the folders:

|Folder       |Description      |
|:---|:---|
|[1 Platform Install](/1%20Platform%20Install)|Can be ignored. Random assets related to configuring the test environment from scratch| 
|[2 Base Image](/2%20Base%20Image)|Step-through of building a simple REST, WEB and database sample app and deploying it to an OpenShift cluster|
|[3 Machine Agent](/3%20Machine%20Agent)|Step-through for setting up a DaemonSet for the Server Monitor agent|
|[4 Tomcat Testing](/4%20Tomcat%20Testing)|Can be ignored. Initial testing of building an instrumented Tomcat container|
|[5 Full Package](/5%20Full%20Package)|USE THIS. Full instructions for deploying a self-contained application to OpenShift|


# Recommended approach

The recommended approach:
1. Create a configMap to configure controller environment variables
  * An example can be seen in the [initContainer](https://github.com/appddave/openshift-testing/tree/master/6%20initContainer#create-the-configmap) project
2. Create an initContainer for the monitored Openshift pods
  * An example can be seen in the [initContainer](https://github.com/appddave/openshift-testing/tree/master/6%20initContainer#prepare-the-initcontainer) project
3. Deploy a machine agent deamonSet
  * An example can be seen in the [Machine Agent](https://github.com/appddave/openshift-testing/tree/master/3%20Machine%20Agent) project 
