FROM wordpress:6-apache 

COPY custom-php.ini /usr/local/etc/php/conf.d/custom-php.ini

## install memcached

RUN apt-get update
RUN apt-get install -y libz-dev libmemcached-dev && \
apt-get install -y memcached libmemcached-tools && \
pecl install memcached && \
docker-php-ext-enable memcached
