#!/bin/sh

if [ ! -f /var/www/html/wp-config.php ]; then
	cd /var/www/html
	rm index.html
	touch index.html
	echo "<html><head><title>Qjungo</title></head><body><h1>Qjungo</h1></body></html>" >> index.html
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
	sleep 2
done

# while ! mysqladmin ping -h"$MYSQL_HOSTNAME" --silent; do
# 	echo "Waiting for MySQL server $MYSQL_HOSTNAME to be available..."
# 	sleep 2
# done

exec "$@"
