FROM centos:latest
RUN dnf yum install httpd -y
ENV DEBIAN_FOREGROUND=nomitractive
CMD ["httpd","-D","FORGROUND"]
RUN echo "hello ramji" > /var/www/html/index.html

