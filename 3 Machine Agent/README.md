# Install the DaemonSet to monitor the node and containers

This is an example of how to run an AppDynamics machine agent as an OpenShift daemonset in order to monitor the Kubernetes host machine, and any containers running an application agent.

## Create a service account

`oc login -u admin -p admin`

`oc create serviceaccount appd`

`oc policy add-role-to-user view -z appd`

`oc adm policy add-scc-to-user privileged -z appd`

## Configure the AppD variables

```
containers:
        - env:
            - name: APPDYNAMICS_CONTROLLER_HOST_NAME
              value: ""
            - name: APPDYNAMICS_CONTROLLER_PORT
              value: ""
            - name: APPDYNAMICS_AGENT_ACCOUNT_NAME
              value: "customer1"
            - name: APPDYNAMICS_AGENT_ACCOUNT_ACCESS_KEY
              value: ""
            - name: APPDYNAMICS_SIM_ENABLED
              value: "true"
            - name: APPDYNAMICS_DOCKER_ENABLED
              value: "true"
            - name: APPDYNAMICS_CONTROLLER_SSL_ENABLED
              value: "false"
```

TODO These could potentially be configured as a ConfigMap. Need to test. 

## Deploy the agent
`oc create -f appd-agents.yml` 
