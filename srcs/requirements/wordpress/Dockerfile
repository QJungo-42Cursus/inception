FROM debian:buster

LABEL maintainer="Quentin Jungo <qjungo@student.42lausanne.ch>"

RUN apt-get update -y
RUN apt-get install -y \
	wget \
	libzip-dev \
	ghostscript \
	php7.3 \
	php7.3-fpm \
	php7.3-mysql \
	mariadb-server

RUN useradd http

COPY ./wp-cli.phar /usr/local/bin/wp
RUN chmod +x /usr/local/bin/wp
COPY ./create-wp.sh /usr/local/bin/create-wp.sh
RUN chmod +x /usr/local/bin/create-wp.sh

COPY ./php-fpm.conf /etc/php/7.3/fpm/php-fpm.conf
RUN php-fpm7.3 -t

WORKDIR /var/www/html

ENTRYPOINT [ "create-wp.sh" ]
