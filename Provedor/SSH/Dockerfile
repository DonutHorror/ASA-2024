FROM ubuntu:latest

RUN apt update && apt install -y openssh-server
RUN mkdir /var/run/sshd

RUN useradd -m vitor
RUN useradd -m texeira

RUN echo 'root:password' | chpasswd
RUN echo "vitor:root" | chpasswd
RUN echo "texeira:root" | chpasswd

RUN sed -i 's/PermitRootLogin prohibit-password/PermitRootLogin no/' /etc/ssh/sshd_config

RUN mkdir -p /root/.ssh && chmod 700 /root/.ssh

EXPOSE 22

CMD ["/usr/sbin/sshd", "-D"]