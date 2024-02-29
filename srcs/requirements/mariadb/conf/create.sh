#!/bin/bash

service mariadb start

echo "---- Un cambio para saber que coge el script actualizado v11 ----"

mysql -u root -e "CREATE DATABASE IF NOT EXISTS \`${SQL_DB}\`;" #Por alguna razón falla esta linea
temp=$?
if [ $temp -ne 0 ]
then
	echo "Base de datos falla"
fi
mysql -u root -e "CREATE USER IF NOT EXISTS '${SQL_USER}'@'%' IDENTIFIED BY '${SQL_PWD}';"
temp=$?
if [ $temp -ne 0 ]
then
	echo "No se ha creado el usuario"
fi
mysql -u root -e "GRANT ALL PRIVILEGES ON \`${SQL_DB}\`.* TO \`${SQL_USER}\`@'%' IDENTIFIED BY '${SQL_PWD}';" #Por alguna razón falla esta linea
temp=$?
if [ $temp -ne 0 ]
then
	echo "No se han dado privilegios"
fi
mysql -u root -e "FLUSH PRIVILEGES;"
mysql -u root -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${SQL_ROOT_PWD}';"
temp=$?
if [ $temp -ne 0 ]
then
	echo "El root tampoco se ha modificado"
fi

mysqladmin -u root -p$SQL_ROOT_PWD shutdown
