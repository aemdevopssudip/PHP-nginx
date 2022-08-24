#FROM php:7.0-apache
#COPY src/ /var/www/html
#EXPOSE 80

FROM ubuntu:22.04
COPY . /app
RUN apt-get update
RUN apt-get install nginx -y
EXPOSE 80
CMD ["echo", "Image CREATED"]
