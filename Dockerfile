#FROM php:7.0-apache
#COPY src/ /var/www/html
#EXPOSE 80

FROM ubuntu:22.04
COPY . /app
RUN apt-get update
RUN apt-get install nginx -y

RUN apt-get install php-fpm php-mysql -y
RUN mkdir /var/www/my_domain
RUN chown -R $root:$root /var/www/my_domain
RUN echo "server {
    listen 80;
    server_name my_domain www.my_domain;
    root /var/www/your_domain;

    index index.html index.htm index.php;

    location / {
        try_files $uri $uri/ =404;
    }

    location ~ \.php$ {
        include snippets/fastcgi-php.conf;
        fastcgi_pass unix:/var/run/php/php7.4-fpm.sock;
     }

    location ~ /\.ht {
        deny all;
    }

}" > /etc/nginx/sites-available/my_domain 

RUN ln -s /etc/nginx/sites-available/my_domain /etc/nginx/sites-enabled/
RUN unlink /etc/nginx/sites-enabled/default
RUN nginx -t
RUN systemctl reload nginx
EXPOSE 80
CMD ["/usr/sbin/nginx", "-g", "daemon off;"]
