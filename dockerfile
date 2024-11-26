FROM centos:latest
RUN dnf yum install httpd -y
RUN echo "hello ramji" > /var/www/html/index.html
CMD ["httpd","-D","FORGROUND"]

