FROM debian:buster

LABEL maintainer="Quentin Jungo <qjungo@student.42lausanne.ch>"

RUN apt-get update
RUN apt-get install -y nginx openssl

RUN if [ ! -f /etc/ssl/certs/nginx.crt ]; then \
        openssl req -x509 -nodes -days 365 -newkey rsa:4096 -keyout /etc/ssl/private/nginx.key -out /etc/ssl/certs/nginx.crt -subj "/C=CH/ST=Lausanne/L=Lausanne/O=42 School/OU=qjungo/CN=qjungo/"; \
        fi

RUN mkdir -p /run/nginx
COPY ./conf/config /etc/nginx/conf.d/default.conf
COPY ./tools/run_nginx.sh /usr/local/bin/run_nginx.sh


RUN chmod +x /usr/local/bin/run_nginx.sh

ENTRYPOINT [ "run_nginx.sh" ]
