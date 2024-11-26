#FROM centos:latest
#RUN yum -y update yum install httpd -y 
#ENV DEBIAN_FOREGROUND=nomitractive
#CMD ["/usr/sbin/httpd","-D","FORGROUND"]
#RUN echo "hello ramji" > /var/www/html/index.html

# Use the official CentOS image from Docker Hub
FROM centos:latest

# Set the maintainer label (optional)
LABEL maintainer="your-email@example.com"

# Update and install necessary packages (optional)
RUN yum -y update && yum -y install epel-release && \
yum -y clean all

# Set the default command to run when the container starts
CMD ["/bin/bash"]
