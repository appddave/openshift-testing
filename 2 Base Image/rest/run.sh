#!/bin/sh

export JAVA_AGENT_LOG_PATH="\"/tomcat/appagent/ver${APPD_AGENT_VERSION}/logs/rest"\"
export APP_SERVER_AGENT_JAVA_OPTS="-Dappdynamics.controller.hostName=${CONTROLLER_URL} -Dappdynamics.controller.port=${CONTROLLER_PORT} -Dappdynamics.controller.ssl.enabled=false -Dappdynamics.agent.applicationName=SampleApp -Dappdynamics.agent.tierName=Appd -Dappdynamics.agent.nodeName=host1  -Dappdynamics.agent.accountName=${CONTROLLER_ACCOUNT_NAME} -Dappdynamics.agent.accountAccessKey=${CONTROLLER_ACCESS_KEY}"
export CATALINA_OPTS="${CATALINA_OPTS} -javaagent:${CATALINA_HOME}/appagent/javaagent.jar ${APP_SERVER_AGENT_JAVA_OPTS}" 

echo "Starting Tomcat and Java Agent with system properties: ${CATALINA_OPTS}"
${CATALINA_HOME}/bin/startup.sh

while :; do
sleep 300
done
