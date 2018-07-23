FROM centos:7

RUN yum -y update

RUN mkdir /sharedFiles

#COPY agents/ver4.3/AppServerAgent-4.3.3.7.zip /sharedFiles/AppServerAgent.zip
#COPY agents/ver4.4/AppServerAgent-4.4.3.23530.zip /sharedFiles/AppServerAgent.zip
COPY agents/ver4.5/AppServerAgent-4.5.0.23604.zip /sharedFiles/AppServerAgent.zip

COPY extractAgent.sh /sharedFiles/extractAgent.sh
COPY startup.sh /sharedFiles/startup.sh
