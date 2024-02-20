FROM	debian:11

RUN	apt update -y && apt upgrade -y
RUN	apt install -y mariadb-server

COPY	conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf
COPY	conf/initdb.sh /

CMD	["/initdb.sh"]
