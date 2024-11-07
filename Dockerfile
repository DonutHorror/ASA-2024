#ubuntu-bind9
#docker build -t [nome] .
#docker run --name bind [nome]
#docker container cp bind:[path]
FROM ubuntu:latest

RUN apt update -y 
RUN apt install bind9 dnsutils -y

CMD ["/usr/sbin/named", "-g", "-c", "/etc/bind/named.conf", "-u", "bind"]

