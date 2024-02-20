FROM	debian:11

RUN	apt update -y && apt upgrade -y
RUN	apt install -y wget php7.4 php-fpm php-mysql mariadb-client
RUN	wget https://wordpress.org/wordpress-6.4.3.tar.gz -P /var/www
RUN	cd /var/www && tar -xzf wordpress-6.4.3.tar.gz && rm wordpress-6.4.3.tar.gz
RUN	chown -R root:root /var/www/wordpress
RUN	wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN	chmod -x wp-cli.phar
RUN	mv wp-cli.phar /usr/local/bin/wp
