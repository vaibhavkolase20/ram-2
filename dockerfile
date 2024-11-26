FROM centos:9
RUN yum install httpd -y
RUN echo "<h1> hello ram <h1>"
CMD httpd -D DEBIAN_FOREGROUND
EXPOSE 80
