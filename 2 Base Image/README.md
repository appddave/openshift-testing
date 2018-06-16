# Base Docker image

This image runs a simple Tomcat REST application, downloads and installs the AppD application, database and machine agents.

To run the application use:
The simple examples below use curl, but you can [Postman](https://www.getpostman.com/apps) or other REST clients for POST, PUT and DELETE operations and your browser for GET requests.

CREATE

- `curl -X POST -H "Content-Type:application/json" localdocker:8080/SampleApp/products -d '{"name":"iPhone", "stock":1 }'`

UPDATE

- `curl -X PUT -H "Content-Type:application/json" localdocker:8080/SampleApp/products/1 -d '{"name":"iPad", "stock":3 }'`

DELETE

- `curl -X DELETE localdocker:8080/SampleApp/products/1`

LIST

- `curl -X GET localdocker:8080/SampleApp/products`

VIEW

- `curl -X GET localdocker:8080/SampleApp/products/1`

### Using the REST Interface - Exceptions
There is also a REST interface to trigger Java and SQL Exceptions and to run a slow transaction:

Trigger a Java Exception

- `curl -v localdocker:8080/SampleApp/exceptions/java`
- returns `HTTP/1.1 500 Internal Server Error`

Trigger a SQL Exception

- `curl -v localdocker:8080/SampleApp/exceptions/sql`
- returns `HTTP/1.1 500 Internal Server Error`

Trigger a Slow Transaction

- `curl -v localdocker:8080/SampleApp/exceptions/slow/10`
- Path Param specifies number of seconds to complete
- returns `HTTP/1.1 200 OK`

## Build docker image
docker build .

## Pull Image
docker pull appddave/appd-sample

# OpenShift setup

## Add the sample application to the project

- Open Project
- Deploy Image
- Enter Image Name `appddave/appd-sample`
- Deploy Image

## Create a new config map with the following key:value pairs
|Key|Description|
|--------------------------------|----------------------------------------------------------------|
|CONTROLLER_URL|AppD Controller URL (eg. 44controllerevents.appdynamics.com)|
|CONTROLLER_PORT|Controller port, typically 8090 for on prem controllers|
|CONTROLLER_ACCOUNT_NAME|Account Name from the License screen in the controller, typically customer1|
|CONTROLLER_ACCESS_KEY|Access Key from the license page|
|PORTAL_USERNAME|Username for download.appdynamics.com|
|PORTAL_PASSWORD|Password for download.appdynamics.com|
|AGENT_VERSION|Your 4 digit controller version, for example: 4.4.0.0|

 Add the config map to the sample app.



