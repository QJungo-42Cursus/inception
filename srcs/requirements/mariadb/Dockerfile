FROM debian:buster

LABEL maintainer="Quentin Jungo <qjungo@student.42lausanne.ch>"

RUN	apt-get update -y
RUN	apt-get install -y mariadb-server 

COPY ./tools/mariadb.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/mariadb.sh
ENTRYPOINT ["mariadb.sh"]