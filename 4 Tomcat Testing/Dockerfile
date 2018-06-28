FROM centos:centos7
MAINTAINER david.borgeest@appdynamics.com

# Install OpenJDK 8
#RUN yum install -y java-1.8.0-openjdk-devel
RUN yum install -y java-1.8.0-openjdk-devel
#ENV JAVA_HOME /usr/lib/jvm/jre-1.8.0-openjdk.x86_64
ENV JAVA_HOME /usr/lib/jvm/jre-1.8.0-openjdk
ENV PATH $JAVA_HOME/bin:$PATH

# set timezone to UTC
RUN mv /etc/localtime /etc/localtime.bak
RUN ln -s /usr/share/zoneinfo/Etc/UTC /etc/localtime

# Install OS packages
# RUN yum install -y wget unzip rsyslog

# Environment vars: Tomcat
# ENV TOMCAT_MAJOR_VERSION 8
# ENV TOMCAT_MINOR_VERSION 8.0.14
# ENV CATALINA_HOME /tomcat

# Install Tomcat
# RUN curl -O -k https://archive.apache.org/dist/tomcat/tomcat-${TOMCAT_MAJOR_VERSION}/v${TOMCAT_MINOR_VERSION}/bin/apache-tomcat-${TOMCAT_MINOR_VERSION}.tar.gz \
#     && curl -O -k https://archive.apache.org/dist/tomcat/tomcat-${TOMCAT_MAJOR_VERSION}/v${TOMCAT_MINOR_VERSION}/bin/apache-tomcat-${TOMCAT_MINOR_VERSION}.tar.gz.md5 \
#     && md5sum apache-tomcat-${TOMCAT_MINOR_VERSION}.tar.gz.md5 \
#     && tar zxf apache-tomcat-*.tar.gz \
#     && rm apache-tomcat-*.tar.gz* \
#     && mv apache-tomcat-${TOMCAT_MINOR_VERSION} tomcat
# RUN cd ${CATALINA_HOME}/bin;chmod +x *.sh
# RUN rm -rf ${CATALINA_HOME}/webapps/*

ADD run.sh /run.sh
RUN chmod +x /*.sh
ENTRYPOINT ["/run.sh"]