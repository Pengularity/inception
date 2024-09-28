FROM debian:buster

EXPOSE 3306

ARG DB_NAME
ARG DB_USER
ARG DB_PASSWORD
ARG DB_ROOT_PASSWORD

RUN apt-get update && apt-get install -y mariadb-server && \
	rm -rf /var/lib/apt/lists/*

#COPY conf/50-server.cnf /etc/mysql/mariadb.conf.d/

COPY tools/create_user.sh /usr/local/bin/
RUN bash /usr/local/bin/create_user.sh && rm /usr/local/bin/create_user.sh

CMD ["mysqld_safe"]
