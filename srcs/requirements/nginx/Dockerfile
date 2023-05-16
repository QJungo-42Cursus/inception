FROM debian:buster

LABEL maintainer="Quentin Jungo <qjungo@student.42lausanne.ch>"

RUN apt-get update
RUN apt-get install -y nginx openssl


RUN mkdir /etc/nginx/ssl
# RUN openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes \
#         -out /etc/nginx/ssl/qjungo.pem \
#         -keyout /etc/nginx/ssl/qjungo.key \
#         -subj "/C=CH/ST=Lausanne/L=Lausanne/O=42 School/OU=qjungo/CN=qjungo/"

RUN if [ ! -f /etc/ssl/certs/nginx.crt ]; then \
        openssl req -x509 -nodes -days 365 -newkey rsa:4096 -keyout /etc/ssl/private/nginx.key -out /etc/ssl/certs/nginx.crt -subj "/C=CH/ST=Lausanne/L=Lausanne/O=42 School/OU=qjungo/CN=qjungo/"; \
        fi

# nginx config
RUN mkdir -p /run/nginx
COPY ./conf/config /etc/nginx/conf.d/default.conf
COPY ./tools/run_nginx.sh /usr/local/bin/run_nginx.sh

RUN chmod +x /usr/local/bin/run_nginx.sh

ENTRYPOINT [ "run_nginx.sh" ]
