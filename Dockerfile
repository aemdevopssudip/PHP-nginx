#FROM php:7.0-apache
#COPY src/ /var/www/html
#EXPOSE 80

FROM ubuntu:22.04
COPY . /app
RUN sudo apt-get update
RUN sudo apt install nginx -y
CMD ["sudo", "systemctl", "start", "nginx"]
CMD ["sudo", "systemctl", "enable", "nginx"]
