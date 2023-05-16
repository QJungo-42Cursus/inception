FROM debian:buster

LABEL maintainer="Quentin Jungo <qjungo@student.42lausanne.ch>"

RUN	apt update -y
RUN	apt install mariadb-server -y

COPY ./tools/mariadb.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/mariadb.sh

ENTRYPOINT ["mariadb.sh"]
CMD [ "mysqld" ]