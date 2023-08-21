# Imagen para entorno PHP
FROM php:8.1.19-fpm

RUN apt-get update && apt-get install -y --no-install-recommends \
    apt-utils \
    curl \
    unzip \
    gnupg2 \
    libzip-dev \
    zip \
    libpng-dev \
    zlib1g-dev \
    lsb-release \
    net-tools \
    && apt-get clean \
    && rm -fr /var/lib/apt/lists/*
 
# Instalamos composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
 
# Instalacion y activacion de extensiones PHP
RUN docker-php-ext-install pcntl gd mysqli pdo pdo_mysql zip

RUN groupadd -g 1000 usuario && useradd -u 1000 -g usuario -m usuario
RUN usermod -u 101 www-data

WORKDIR /var/www

RUN chown -R usuario:usuario /var/www
USER usuario
