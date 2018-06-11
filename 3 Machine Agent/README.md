# Install the DaemonSet to monitor the node and containers

## Create a service account

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
