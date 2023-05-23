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

COPY ./create-wp.sh /usr/local/bin/create-wp.sh
COPY ./wp-cli.phar /usr/local/bin/wp
RUN chmod +x /usr/local/bin/create-wp.sh
RUN chmod +x /usr/local/bin/wp

COPY ./php-fpm.conf /etc/php/7.3/fpm/php-fpm.conf
RUN php-fpm7.3 -t

WORKDIR /var/www/html

RUN rm -rf /var/www/html/*
RUN rm index.html

RUN wp core download \
	--locale="en_US" \
	--allow-root

RUN wp core config \
	--dbname="${MYSQL_DATABASE}" \
	--dbuser="${MYSQL_USER}" \
	--dbhost="${MYSQL_HOSTNAME}" \
	--dbpass="${MYSQL_PASSWORD}" \
	--allow-root

RUN chmod 777 wp-config.php

RUN wp core install \
	--url=qjungo.42.fr \
	--title="Rust" \
	--admin_user="${WORDPRESS_ADMIN}" \
	--admin_password="${WORDPRESS_PASSWORD}" \
	--admin_email="${WORDPRESS_MAIL}" \
	--allow-root

RUN wp user create \
	"${WORDPRESS_USER}" \
	"${WORDPRESS_USER_MAIL}" \
	--role="author" \
	--user_pass="${WORDPRESS_USER_PASSWORD}" \
	--allow-root

ENTRYPOINT [ "php-fpm7.3", "-F" ]
