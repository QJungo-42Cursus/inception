FROM debian:buster

LABEL maintainer="Quentin Jungo <qjungo@student.42lausanne.ch>"

RUN apt-get update -y
RUN apt-get install -y \
	wget \
	libzip-dev \
	ghostscript \
	php7.3 \
	php7.3-fpm \
	php7.3-mysql

COPY ./tools/create-wp.sh /usr/local/bin/create-wp.sh
COPY ./conf/php-fpm.conf /etc/php/7.3/fpm/php-fpm.conf

RUN useradd http
RUN php-fpm7.3 -t
RUN chmod +x /usr/local/bin/create-wp.sh

ENTRYPOINT [ "create-wp.sh" ]
