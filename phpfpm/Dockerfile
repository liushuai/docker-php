FROM php:5.6.30-fpm-alpine
RUN apk add --no-cache autoconf dpkg-dev dpkg file g++ gcc \
libc-dev make pcre-dev pkgconf re2c openssl openssl-dev tcl \
tcl-dev gnupg coreutils jpeg-dev freetype-dev ffmpeg
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

