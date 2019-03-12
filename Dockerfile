FROM ubuntu:16.04

RUN apt-get update \
    && apt-get install -y nginx \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

RUN mkdir -p /etc/nginx/certs \
    touch /etc/nginx/certs/cert.key \
    touch /etc/nginx/certs/cert.pem

COPY nginx.conf /etc/nginx/
COPY start_nginx /start_nginx

RUN chmod +x /start_nginx

VOLUME /var/nginx
VOLUME /var/log/nginx
VOLUME /etc/nginx/certs

EXPOSE 80 443
ENTRYPOINT ["/start_nginx"]
