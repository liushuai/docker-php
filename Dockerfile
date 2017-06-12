FROM php:5.6.30-alpine
RUN apk add --no-cache --virtual .phpize-deps $PHPIZE_DEPS linux-headers \
&& cd /usr/local/bin \
&& ./docker-php-ext-install gd \
&& apk del .phpize-deps
