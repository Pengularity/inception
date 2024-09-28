FROM debian:buster

RUN apt-get update && apt-get install -y --no-install-recommends \
    nginx \
    openssl && \
    rm -rf /var/lib/apt/lists/*

RUN mkdir -p /etc/nginx/ssl

RUN openssl req --x509 -days 365 -nodes -newkey rsa:4096 \
    -keyout /etc/nginx/ssl/nginx.key \
    -out /etc/nginx/ssl/nginx.crt --sha256 \
    -subj "/C=FR/ST=IDF/L=Paris/0=42/OU=42/CN=wnguyen.42.fr"

COPY ./conf/nginx.conf /etc/nginx/nginx.conf

EXPOSE 80 443

CMD ["nginx", "-g", "daemon off;"]
	
