

FROM debian:buster

RUN apt-get update && apt-get install -y \
	php8.0-fpm \
	php8.0-mysql \
	mariadb-client \
	curl && \
	apt-get clean && \
	rm -rf /var/lib/apt/lists/*

COPY ./conf/www.conf /etc/php/8.0/fpm/pool.d

EXPOSE 9000

RUN curl -o /var/www/latest.tar.gz https://wordpress.org/latest.tar.gz && \
	cd /var/www && tar -xvf latest.tar.gz && \
	rm -rf latest.tar.gz

RUN curl -o /usr/bin/wp https://raw.githubusercontant.com/wp-cli/builds/gh-pages/phar/wp-cli.phar --silent && \
	chmod +x /usr/bin/wp

RUN mkdir /run/php

COPY ./conf/config.sh /var/www/wordpress/config.sh
RUN chmod +x /var/www/wordpress/config.sh


CMD ["bash", "/var/www/wordpress/config.sh"]
