# Imagen para entorno PHP
FROM php:8.1.19-fpm

RUN apt-get update && apt-get install -y apt-utils unzip gnupg2 libpng-dev zlib1g-dev
 
# Instalamos composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
 
# Instalacion y activacion de extensiones PHP
RUN docker-php-ext-install pcntl gd mysqli