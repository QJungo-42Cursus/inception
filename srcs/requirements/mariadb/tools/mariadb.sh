#!/bin/sh

mysql_install_db

/etc/init.d/mysql start

if [ ! -d "/var/lib/mysql/$MYSQL_DATABASE" ] ; then

# # Set root option so that connexion without root password is not possible
# mysql_secure_installation << _EOF_

# Y
# $MYSQL_ROOT_PASSWORD
# $MYSQL_ROOT_PASSWORD
# Y
# n
# Y
# Y
# _EOF_
# # empty password
# # set root password ?
# # the new password
# # confirm the new password
# # remove anonymous users ?
# # disallow root login remotely ?
# # remove test database and access to it ?
# # reload privilege tables now ?

# #Add a root user on 127.0.0.1 to allow remote connexion 
# #Flush privileges allow to your sql tables to be updated automatically when you modify it
# mysql --user=root launch mysql command line client
# mysql --user=root << _EOF_
# GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD';
# FLUSH PRIVILEGES;
# _EOF_

# Create database and user in the database for wordpress
mysql --user=root << _EOF_
CREATE DATABASE IF NOT EXISTS $MYSQL_DATABASE;
CREATE USER IF NOT EXISTS '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';
GRANT ALL PRIVILEGES ON $MYSQL_DATABASE.* TO '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';
FLUSH PRIVILEGES;
ALTER USER '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';
_EOF_

fi

/etc/init.d/mysql stop

mysqld --user=root --console --bind-address=0.0.0.0