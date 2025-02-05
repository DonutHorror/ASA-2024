FROM ubuntu:latest

RUN apt-get update && apt-get install -y bind9 bind9-utils dnsutils -y

COPY ./bind/named.conf.local /etc/bind
COPY ./bind/db.praia.com /etc/bind

EXPOSE 53

CMD ["/usr/sbin/named", "-g", "-c", "/etc/bind/named.conf", "-u", "bind"]