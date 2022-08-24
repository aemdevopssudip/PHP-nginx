#FROM php:7.0-apache
#COPY src/ /var/www/html
#EXPOSE 80

FROM ubuntu:22.04
COPY . /app
RUN apt-get update
RUN apt-get install nginx -y

ENV TZ=Indian \
    DEBIAN_FRONTEND=noninteractive
RUN apt-get install php-fpm php-mysql -y
RUN mkdir /var/www/my_domain
RUN chown -R $root:$root /var/www/my_domain
COPY ./my_domain /etc/nginx/sites-available/my_domain 

RUN ln -s /etc/nginx/sites-available/my_domain /etc/nginx/sites-enabled/
RUN unlink /etc/nginx/sites-enabled/default
RUN nginx -t
EXPOSE 80
RUN /usr/sbin/nginx -g daemon off;
CMD ["systemctl", "reload", "nginx"]
