FROM mysql:5.7

MAINTAINER Mahmoud Zalt <mahmoud@zalt.me>

ADD startup /etc/mysql/startup

RUN chown -R mysql:root /var/lib/mysql/

ARG MYSQL_DATABASE=homestead
ARG MYSQL_USER=homestead
ARG MYSQL_PASSWORD=secret
ARG MYSQL_ROOT_PASSWORD=root

ENV MYSQL_DATABASE=homestead
ENV MYSQL_USER=homestead
ENV MYSQL_PASSWORD=secret
ENV MYSQL_ROOT_PASSWORD=root

RUN sed -i 's/MYSQL_DATABASE/'$MYSQL_DATABASE'/g' /etc/mysql/startup && \
    sed -i 's/MYSQL_USER/'$MYSQL_USER'/g' /etc/mysql/startup && \
    sed -i 's/MYSQL_PASSWORD/'$MYSQL_PASSWORD'/g' /etc/mysql/startup

ADD my.cnf /etc/mysql/conf.d/my.cnf

CMD ["mysqld", "--init-file=/etc/mysql/startup"]

EXPOSE 3306
