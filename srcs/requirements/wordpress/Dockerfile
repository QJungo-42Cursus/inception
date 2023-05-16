FROM debian:buster

LABEL maintainer="Quentin Jungo <qjungo@student.42lausanne.ch>"

# Install dependencies
RUN apt update  -y
RUN apt install -y \
	wget \
	libzip-dev \
	ghostscript \
	php \
	php-fpm \
	php-bcmath \
	php-curl \
	php-imagick \
	php-intl \
	php-json \
	php-mbstring \
	php-mysql \
	php-xml \
	php-zip

COPY ./tools/create-wp.sh /usr/local/bin/create-wp.sh

RUN chmod +x /usr/local/bin/create-wp.sh

ENTRYPOINT ["create-wp.sh"]

CMD [ "php-fpm", "--nodaemonize"]
