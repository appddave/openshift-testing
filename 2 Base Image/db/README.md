# Deploy the database service

Deploys the standard official MySQL image from the Docker Hub. 


## Ensure we're in the correct 

`oc project appd-sample`

## Create the mysql app

The sample app is expecting the database service to be called 'db'

`oc new-app mysql --name=db`

## Expose the database service on port 3306

`oc expose svc/db`

## Apply config

The config file contains the default password

`oc create -f appd-configmap.yml`

`oc set env dc/db --from=configmap/mysql-config`
