FROM ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt update && apt install -y apache2

RUN date -u > /var/www/html/buildtime.txt

COPY html/ /var/www/html/

RUN sed -i 's/80/81/g' /etc/apache2/ports.conf && \
    sed -i 's/<VirtualHost \*:80>/<VirtualHost *:81>/g' /etc/apache2/sites-available/000-default.conf

WORKDIR /home/ubuntu/

EXPOSE 81/tcp

CMD service apache2 start && bash

