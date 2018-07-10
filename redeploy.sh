#!/bin/bash

oc login -u system:admin
oc delete project appd-sample
oc login -u developer
oc new-project appd-sample
oc login -u system:admin
oc adm policy add-scc-to-user anyuid system:serviceaccount:appd-sample:default
oc login -u developer
oc new-app appddave/appd-sample:2.5
oc expose svc/appd-sample
oc create -f 2\ Base\ Image/rest/appd-configmap.yml
oc set env dc/appd-sample --from=configmap/appd-config
oc new-app mysql --name=db
oc create -f 2\ Base\ Image/db/appd-configmap.yml
oc set env dc/db --from=configmap/mysql-config
oc new-app appddave/web:2
oc expose svc/web
oc create -f 2\ Base\ Image/web/appd-configmap.yml
oc set env dc/web --from=configmap/appd-web-config
