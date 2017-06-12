FROM php:5.6.30-alpine
RUN apk add --no-cache --virtual .phpize-deps $PHPIZE_DEPS linux-headers \
&& apk del .phpize-deps
