#!/bin/bash

cd /var/www/html

wp core download --allow-root

wp config create --allow-root --dbname=$SQL_DB --dbuser=$SQL_USER --dbpass=$SQL_PWD --dbhost=mariadb --path='/var/www/html'

wp core install --url=$DOMAIN_NAME --title=$WP_TITLE --admin_user=$WP_ADMIN_USER --admin_password=$WP_ADMIN_PWD --admin_email=$WP_ADMIN_EMAIL --skip-email --allow-root

wp user create $WP_USER $WP_EMAIL --role=author --user_pass=$WP_PWD --allow-root
#wp theme activate twentytwentytwo --allow-root

sed -i 's/listen = \/run\/php\/php7.4-fpm.sock/listen = 9000/g' /etc/php/7.4/fpm/pool.d/www.conf
mkdir /run/php

/usr/sbin/php-fpm7.4 -F
