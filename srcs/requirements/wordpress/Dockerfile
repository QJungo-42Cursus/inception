FROM debian:buster

LABEL maintainer="Quentin Jungo <qjungo@student.42lausanne.ch>"

RUN apt update -y
RUN apt install -y \
	wget \
	libzip-dev \
	ghostscript \
	php7.3 \
	php7.3-fpm

COPY ./tools/create-wp.sh /usr/local/bin/create-wp.sh
COPY ./conf/php-pfm.conf /etc/php/7.3/fpm/php-fpm.conf

RUN chmod +x /usr/local/bin/create-wp.sh

ENTRYPOINT [ "create-wp.sh" ]
