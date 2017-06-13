FROM php:5.6.30-fpm-alpine
RUN apk add --no-cache jpeg-dev freetype-dev
RUN docker-php-ext-install pdo_mysql

#####################################
# gd:
#####################################

# Install the PHP gd library
RUN docker-php-ext-configure gd \
        --enable-gd-native-ttf \
        --with-jpeg-dir=/usr/include \
        --with-freetype-dir=/usr/include && \
    docker-php-ext-install gd
