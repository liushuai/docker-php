FROM php:5.6.30-fpm-alpine
RUN apk add --no-cache bash git vim openssl jpeg-dev freetype-dev ffmpeg
RUN docker-php-ext-install pdo_mysql

#####################################
# sqlite3 with sqlcipher and other depends:
#####################################
RUN apk add --no-cache --virtual .phpize-deps $PHPIZE_DEPS linux-headers openssl-dev tcl tcl-dev gnupg coreutils sqlite-dev \
&& docker-php-source extract
COPY ./sqlcipher-master.zip /usr/src/
RUN mkdir /usr/src/sqlcipher \
&& unzip /usr/src/sqlcipher-master.zip -d /usr/src/sqlcipher \
&& cd /usr/src/sqlcipher/sqlcipher-master \
&& ./configure --enable-tempstore=yes CFLAGS="-DSQLITE_HAS_CODEC" LDFLAGS="-lcrypto" \
&& make \
&& cd /usr/src/php/ext/sqlite3 \
&& mv config0.m4 config.m4 2> /dev/null \
&& phpize \
&& ./configure --enable-tempstore=yes CFLAGS="-DSQLITE_HAS_CODEC" LDFLAGS="-lcrypto" \
&& cp /usr/src/sqlcipher/sqlcipher-master/sqlite3.c libsqlite \
&& sed -i 's|PHP_FE_END|{NULL,NULL,NULL}|' sqlite3.c \
&& make \
&& docker-php-ext-install sqlite3 \
&& rm -rf /usr/src/sqlcipher \
&& rm -f /usr/src/sqlcipher-master.zip \
&& docker-php-source delete \
&& apk del .phpize-deps


#####################################
# gd:
#####################################

# Install the PHP gd library
RUN docker-php-ext-configure gd \
        --enable-gd-native-ttf \
        --with-jpeg-dir=/usr/include \
        --with-freetype-dir=/usr/include && \
    docker-php-ext-install gd
    
#####################################
# Composer:
#####################################

# Install composer and add its bin to the PATH.
RUN curl -s http://getcomposer.org/installer | php && \
    echo "export PATH=${PATH}:/var/www/vendor/bin" >> ~/.bashrc && \
    mv composer.phar /usr/local/bin/composer



#####################################
# silk-v3 and deps
#####################################

RUN apk add --no-cache --virtual .silkv3-deps g++ gcc make file
RUN cd /var/www && git clone https://github.com/kn007/silk-v3-decoder.git && cd silk-v3-decoder/silk &&\
make && make decoder && \
apk del .silkv3-deps
