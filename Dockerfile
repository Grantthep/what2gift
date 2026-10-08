FROM php:8.3-apache
RUN docker-php-ext-install pdo_mysql
COPY . /var/www/html/
