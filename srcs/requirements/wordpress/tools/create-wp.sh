#!/bin/sh

if [ ! -f /var/www/html/wp-config.php ]; then
	cd /var/www/html
	rm index.html

	wp core download \
	--locale="en_US" \
	--allow-root

	wp core config \
	--dbname="${MYSQL_DATABASE}" \
	--dbuser="${MYSQL_USER}" \
	--dbhost="${MYSQL_HOSTNAME}" \
	--dbpass="${MYSQL_PASSWORD}" \
	--allow-root
	
	chmod 777 wp-config.php

	wp core install \
	--url=qjungo.42.fr \
	--title="Rust" \
	--admin_user="${WORDPRESS_ADMIN}" \
	--admin_password="${WORDPRESS_PASSWORD}" \
	--admin_email="${WORDPRESS_MAIL}" \
	--allow-root

	wp user create \
	"${WORDPRESS_USER}" \
	"${WORDPRESS_USER_MAIL}" \
	--role="author" \
	--user_pass="${WORDPRESS_USER_PASSWORD}" \
	--allow-root
fi

php-fpm7.3 -F;