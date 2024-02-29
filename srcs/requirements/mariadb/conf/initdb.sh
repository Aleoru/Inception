#!/bin/bash

service mariadb start
while ! mysqladmin ping -hlocalhost --silent; do
	echo "Waiting to mariadb..."
	sleep 1
done

mysql -e "CREATE DATABASE IF NOT EXISTS ${SQL_DB};"
mysql -e "CREATE USER IF NOT EXISTS '${SQL_USER}'@'%' IDENTIFIED BY '${SQL_PWD}';"
mysql -e "GRANT ALL PRIVILEGES ON ${SQL_DB}.* TO '${SQL_USER}'@'%' IDENTIFIED BY '${SQL_PWD}';"
mysql -e "FLUSH PRIVILEGES;"
mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${SQL_ROOT_PWD}';"
