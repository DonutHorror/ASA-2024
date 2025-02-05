FROM ubuntu:latest

RUN apt-get update && apt-get install -y bind9 bind9-utils dnsutils -y

EXPOSE 53

CMD ["/usr/sbin/named", "-g", "-c", "/etc/bind/named.conf", "-u", "bind"]