FROM nginx:latest

COPY error.html /usr/share/nginx/html

COPY default.conf /etc/nginx/conf.d
COPY nginx.conf /etc/nginx

RUN mkdir -p /usr/share/nginx/gilson
COPY index.html /usr/share/nginx/gilson