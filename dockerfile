# Use Ubuntu as the base image
FROM ubuntu:20.04

# Set environment variables for Java
ENV JAVA_HOME=/usr/lib/jvm/java-1.8.0-openjdk-amd64
ENV PATH=$JAVA_HOME/bin:$PATH

# Install dependencies: Java, wget (to download Tomcat), and unzip
RUN apt-get update -y && \
    apt-get install -y openjdk-8-jdk wget && \
    apt-get clean

# Download and extract Apache Tomcat 9
RUN wget https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.97/bin/apache-tomcat-9.0.97.tar.gz && \
    tar -xvf apache-tomcat-9.0.97.tar.gz && \
    mv apache-tomcat-9.0.97 /opt/tomcat && \
    rm -f apache-tomcat-9.0.97.tar.gz

# Copy the .war file into the Tomcat webapps folder
COPY project.war /opt/tomcat/webapps/

# Expose port 8080 for the Tomcat server
EXPOSE 8080

# Set the default command to start Tomcat
CMD ["/opt/tomcat/bin/catalina.sh", "run"]



 
