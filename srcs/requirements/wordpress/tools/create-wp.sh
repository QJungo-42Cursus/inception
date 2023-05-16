#!/bin/sh

#if [ -f ./wp-config.php ]
#then
#	echo "Wordpress already installed"
#else
if [ ! -f /var/www/html/wp-config.php ]; then
	cd /var/www/html && echo "Downloading Wordpress" > caca
	wget http://wordpress.org/latest.tar.gz
	tar xfz latest.tar.gz
	mv wordpress/* .
	rm -rf latest.tar.gz
	rm -rf wordpress

	sed -i "s/username_here/$MYSQL_USER/g" wp-config-sample.php
	sed -i "s/password_here/$MYSQL_PASSWORD/g" wp-config-sample.php
	sed -i "s/localhost/$MYSQL_HOSTNAME/g" wp-config-sample.php
	sed -i "s/database_name_here/$MYSQL_DATABASE/g" wp-config-sample.php
	cp wp-config-sample.php wp-config.php
fi

while true; do
	sleep 5
done

exec "$@"
