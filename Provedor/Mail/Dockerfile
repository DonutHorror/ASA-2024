FROM ubuntu:latest

RUN apt update -y
RUN apt upgrade -y

RUN apt install vim postfix dnsutils iputils-ping -y
RUN apt install dovecot-imapd dovecot-pop3d -y
RUN apt install syslog-ng -y

RUN useradd -c 'vitor' -m vitor
RUN useradd -c 'texeira' -m texeira
RUN echo "vitor:root" | chpasswd
RUN echo "texeira:root" | chpasswd

CMD ["sh", "-c", "service syslog-ng start ; service postfix start ; service dovecot start ; tail -F /var/log/mail.log"]