FROM ubuntu:latest

RUN apt update -y

RUN apt install vim postfix dnsutils iputils-ping -y
RUN apt install dovecot-imapd dovecot-pop3d -y
RUN apt install syslog-ng -y

COPY main.cf /etc/postfix
COPY 10-auth.conf /etc/dovecot/conf.d/10-auth.conf

RUN useradd -c 'gilson' -m gilson
RUN useradd -c 'vitor' -m vitor
RUN useradd -c 'texeira' -m texeira
RUN useradd -c 'asa' -m asa

RUN echo "gilson:asa" | chpasswd
RUN echo "vitor:asa" | chpasswd
RUN echo "texeira:asa" | chpasswd
RUN echo "asa:asa" | chpasswd

CMD ["sh", "-c", "service syslog-ng start ; service postfix start ; service dovecot start ; tail -F /var/log/mail.log"]