FROM wordpress:6.5.0-php8.1-apache

COPY custom-php.ini /usr/local/etc/php/conf.d/custom-php.ini

# Actualiza los paquetes e instala las dependencias necesarias
RUN apt-get update && \
    apt-get install -y \
        libmemcached-dev \
        zlib1g-dev \
        libpq-dev \
        libjpeg-dev \
        libpng-dev \
        libfreetype6-dev \
        libssl-dev \
        libzip-dev \
        unzip \
        wget \
        git \
    && rm -rf /var/lib/apt/lists/*

RUN pecl install memcached \
    && docker-php-ext-enable memcached