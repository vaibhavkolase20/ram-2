 FROM ubuntu:20.04
 RUN apt-get update
 RUN apt-get install default-jdk -y
 ADD https://dlcdn.apache.org/tomcat/tomcat-10/v10.1.33/bin/apache-tomcat-10.1.33.tar.gz /opt
 RUN tar -xzf apache-tomcat-10.1.33.tar.gz
 WORKDIR /opt/apache-tomcat-10.1.33/bin
 CMD ["catalina.sh","run"]
 EXPOSE 8080
