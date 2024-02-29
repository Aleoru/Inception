FROM	debian:11

RUN	apt update -y && apt upgrade -y
RUN	apt install -y mariadb-server

COPY	conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf
COPY	conf/initdb.sh /
COPY	conf/create.sh /
#COPY   conf/.env /.env
RUN     chmod +x /initdb.sh
RUN     chmod +x /create.sh
#RUN	export $(cat /.env | xargs)
#RUN     /initdb.sh
EXPOSE	3306

CMD     [ "sh", "/initdb.sh" ]
#CMD	["mysqld_safe"]
