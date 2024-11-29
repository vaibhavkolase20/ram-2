FROM centos:latest
RUN yum install java -yum
ADD https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.97/bin/apache-tomcat-9.0.97.tar.gz
RUN tar -xv ./apache2-tomcat* -C /opt
WORKDIR /opt/apache\*


 