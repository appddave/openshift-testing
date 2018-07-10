#!/bin/bash

restIP=$1

echo "Generating load on ${restIP} until you kill me"

for (( ; ; ))
do
        curl -X POST -H "Content-Type:application/json" ${restIP}:8080/SampleApp/products -d '{"name":"iPhone", "stock":1 }'
        curl -X GET ${restIP}:8080/SampleApp/products
        curl -X PUT -H "Content-Type:application/json" ${restIP}:8080/SampleApp/products/1 -d '{"name":"iPad", "stock":3 }'
        curl -X GET ${restIP}:8080/SampleApp/products/1
        curl -X GET ${restIP}:8080/SampleApp/products/1
        curl -X GET ${restIP}:8080/SampleApp/products/1
        curl -X GET ${restIP}:8080/SampleApp/products/1
        curl -X GET ${restIP}:8080/SampleApp/products/1
        curl -v ${restIP}:8080/SampleApp/exceptions/java
        curl -X GET ${restIP}:8080/SampleApp/products
        curl -X GET ${restIP}:8080/SampleApp/products
        curl -X GET ${restIP}:8080/SampleApp/products
        curl -X GET ${restIP}:8080/SampleApp/products
        curl -v ${restIP}:8080/SampleApp/exceptions/sql
        curl -X GET ${restIP}:8080/SampleApp/products/2
        curl -X GET ${restIP}:8080/SampleApp/products/2
        curl -X GET ${restIP}:8080/SampleApp/products/2
        curl -X GET ${restIP}:8080/SampleApp/products/2
        curl -v ${restIP}:8080/SampleApp/exceptions/slow/10
        curl -X GET ${restIP}:8080/SampleApp/products/1
        curl -X GET ${restIP}:8080/SampleApp/products/1
        curl -X GET ${restIP}:8080/SampleApp/products/1
        curl -X GET ${restIP}:8080/SampleApp/products/1
        curl -X GET ${restIP}:8080/SampleApp/products/1
        curl -X GET ${restIP}:8080/SampleApp/products
        curl -X GET ${restIP}:8080/SampleApp/products
        curl -X GET ${restIP}:8080/SampleApp/products
        curl -X GET ${restIP}:8080/SampleApp/products
        curl -X GET ${restIP}:8080/SampleApp/products
        curl -X GET ${restIP}:8080/SampleApp/products
        curl -X GET ${restIP}:8080/SampleApp/products
        curl -X GET ${restIP}:8080/SampleApp/products
        curl -X GET ${restIP}:8080/SampleApp/products
        curl -X GET ${restIP}:8080/SampleApp/products
        curl -X GET ${restIP}:8080/SampleApp/products
        curl -X GET ${restIP}:8080/SampleApp/products
        curl -v ${restIP}:8080/SampleApp/exceptions/slow/10
        curl -X GET ${restIP}:8080/SampleApp/products/1
        curl -X GET ${restIP}:8080/SampleApp/products/1
        curl -X GET ${restIP}:8080/SampleApp/products/1
        curl -X GET ${restIP}:8080/SampleApp/products/1
        curl -X GET ${restIP}:8080/SampleApp/products/1
        curl -X GET ${restIP}:8080/SampleApp/products
        curl -X GET ${restIP}:8080/SampleApp/products
        curl -X GET ${restIP}:8080/SampleApp/products
        curl -X GET ${restIP}:8080/SampleApp/products
        curl -X GET ${restIP}:8080/SampleApp/products
        curl -X GET ${restIP}:8080/SampleApp/products
        curl -X GET ${restIP}:8080/SampleApp/products
        curl -X GET ${restIP}:8080/SampleApp/products
        curl -X GET ${restIP}:8080/SampleApp/products
        curl -X GET ${restIP}:8080/SampleApp/products
        curl -X GET ${restIP}:8080/SampleApp/products
        curl -X GET ${restIP}:8080/SampleApp/products
        sleep 3
done
