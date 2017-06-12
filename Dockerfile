FROM php:5.6.30-alpine
RUN apk add --no-cache --virtual .phpize-deps $PHPIZE_DEPS linux-headers \
&& docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
&& docker-php-ext-install gd \
&& apk del .phpize-deps
