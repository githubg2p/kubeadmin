FROM tomcat:8
# Take the war and copy to webapps of tomcat
COPY target/*.war /usr/local/tomcat/webapps/
#FROM ubuntu:16.04
#This is a sample Image 
#MAINTAINER demousr@gmail.com 
#RUN apt-add-repository ppa:mc3man/trusty-media
#RUN apt-get update 
#RUN apt-get install -y nginx 
#CMD [“echo”,”Image created”] 
