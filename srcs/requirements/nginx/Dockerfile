FROM debian:buster

LABEL maintainer="Quentin Jungo <qjungo@student.42lausanne.ch>"

RUN apt-get update -y
RUN apt-get install -y openssl
RUN apt-get install -y nginx

RUN if [ ! -f /etc/ssl/certs/nginx.crt ]; then \
        openssl req -x509 -nodes -days 365 -newkey rsa:4096 -keyout /etc/ssl/private/nginx.key -out /etc/ssl/certs/nginx.crt -subj "/C=CH/ST=Lausanne/L=Lausanne/O=42 School/OU=qjungo/CN=qjungo/"; \
        fi

COPY ./fastcgi_params /etc/nginx/conf.d/fastcgi_params
COPY ./qjungo.conf /etc/nginx/conf.d/qjungo.conf

ENTRYPOINT [ "nginx", "-c", "/etc/nginx/conf.d/qjungo.conf" ]