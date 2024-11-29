

# Use the official OpenJDK image as the base image
FROM openjdk:17-jdk-slim

# Set environment variables for Tomcat
ENV TOMCAT_VERSION 10.1.6
ENV TOMCAT_TGZ tomcat-${TOMCAT_VERSION}.tar.gz
ENV TOMCAT_URL https://downloads.apache.org/tomcat/tomcat-10/v${TOMCAT_VERSION}/bin/${TOMCAT_TGZ}

# Set the working directory to /opt
WORKDIR /opt

# Download and extract Tomcat
# अप्ट-गेट अपडेट करा आणि curl इंस्टॉल करा
RUN apt-get update && apt-get install -y curl tar

# Tomcat URL आणि TGZ फाइल डाउनलोड करा
RUN curl -O ${TOMCAT_URL} && \
    tar xvf ${TOMCAT_TGZ} && \
    rm -f ${TOMCAT_TGZ}

# Expose port 8080 for the Tomcat server
EXPOSE 8080

# Set the environment variable for the Tomcat installation
ENV CATALINA_HOME /opt/apache-tomcat-${TOMCAT_VERSION}

# Start Tomcat
CMD ["/opt/apache-tomcat-${TOMCAT_VERSION}/bin/catalina.sh", "run"]

 