#!/bin/bash

#mkdir -p /var/run/mysqld
#chown mysql:mysql /var/run/mysqld
#chmod 775 /var/run/mysqld

service mariadb start

#STATUS=$(grep mariadb | wc -l);

while ! mysqladmin ping -hlocalhost --silent;
#while [ $STATUS -ne 0 ]
do
	#STATUS=$(grep mariadb | wc -l);
	echo "Waiting to mariadb..."
	sleep 1
done

sh /create.sh

exec mysqld_safe