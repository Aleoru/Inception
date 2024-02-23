FROM	debian:11

RUN	apt update -y && apt upgrade -y
RUN	apt install -y php7.4 php-fpm php-mysql mariadb-client
RUN	mkdir -P /var/www/html
RUN	cd /var/www/html
RUN	curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN	chmod -x wp-cli.phar
RUN	mv wp-cli.phar /usr/local/bin/wp

COPY	conf/auto_config.sh /auto_config.sh
RUN	chmod +x /autoconfig.sh

CMD	["/auto_config.sh"]
