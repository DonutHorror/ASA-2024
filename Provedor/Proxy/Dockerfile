FROM nginx:latest

RUN mkdir -p /etc/nginx/ssl

# Gerar certificado e chave autoassinado
RUN openssl req -x509 -newkey rsa:4096 -keyout /etc/nginx/ssl/nginx-selfsigned.key -out /etc/nginx/ssl/nginx-selfsigned.crt -days 365 -nodes -subj "/C=BR/ST=State/L=City/O=Org/OU=IT/CN=proxy.areia.branca.com"
