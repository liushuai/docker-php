FROM php:5.6.30-alpine
RUN apk update
RUN apk add --no-cache RUN apk add --no-cache bash git vim
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
    
#####################################
# Composer:
#####################################

# Install composer and add its bin to the PATH.
RUN curl -s http://getcomposer.org/installer | php && \
    echo "export PATH=${PATH}:/var/www/vendor/bin" >> ~/.bashrc && \
    mv composer.phar /usr/local/bin/composer

