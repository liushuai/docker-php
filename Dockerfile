FROM php:5.6.30-alpine
RUN apk update
RUN apk add --no-cache --virtual .phpize-deps $PHPIZE_DEPS linux-headers \
php5-gd \
&& apk del .phpize-deps

