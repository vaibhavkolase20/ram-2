FROM centos:latest
RUN yum install httpd -y
ENV DEBIAN_FOREGROUND=nomitractive
CMD ["/usr/sbin/httpd","-D","FORGROUND"]
RUN echo "hello ramji" > /var/www/html/index.html
