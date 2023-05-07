FROM debian:buster

MAINTAINER Quentin Jungo <qjungo@student.42lausanne.ch>

# Install dependencies
RUN apt update  -y
RUN apt install -y \
						wget \
						libzip-dev \
						ghostscript \
						php \
						php-bcmath \
						php-curl \
						php-imagick \
						php-intl \
						php-json \
						php-mbstring \
						php-mysql \
						php-xml \
						php-zip

COPY ./tools /var/www/

RUN chmod +x /var/www/create-wp.sh

ENTRYPOINT ["/var/www/create-wp.sh"]
