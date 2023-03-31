FROM debian:wheezy

MAINTAINER Quentin Jungo <qjungo@student.42lausanne.ch>

RUN apt-get update && \
	apt-get install -y nginx
