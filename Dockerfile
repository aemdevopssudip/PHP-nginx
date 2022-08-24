#FROM php:7.0-apache
#COPY src/ /var/www/html
#EXPOSE 80

FROM php:fpm-alpine
RUN docker-php-ext-install opcache
COPY php/production/opcache.ini /usr/local/etc/php/conf.d/opcache.ini
COPY src/ /var/www/html/
