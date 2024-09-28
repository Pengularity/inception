

FROM debian:buster

RUN apt-get update && apt-get install -y \
	php7.3 php-fpm \
	php7.3-mysql \
	mariadb-client \
	curl && \
	apt-get clean && \
	rm -rf /var/lib/apt/lists/*

COPY ./conf/www.conf /etc/php/7.3/fpm/pool.d

EXPOSE 9000

RUN mkdir -p /var/www && \
    chown -R www-data:www-data /var/www && \
    curl -o /var/www/latest.tar.gz https://wordpress.org/latest.tar.gz && \
    cd /var/www && \
    tar -xvf latest.tar.gz && \
    rm -rf latest.tar.gz

RUN curl -o /usr/bin/wp https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar --silent && \
	chmod +x /usr/bin/wp

RUN mkdir /run/php

COPY ./conf/config.sh /var/www/wordpress/config.sh
RUN chmod +x /var/www/wordpress/config.sh


CMD ["bash", "/var/www/wordpress/config.sh"]
