FROM php:7-apache

RUN docker-php-ext-install mysqli

WORKDIR /var/www/html
COPY ["index.php", "conexao.php", "/var/www/html/"]

