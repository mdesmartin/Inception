FROM debian:bullseye

# WORKDIR /app

RUN apt update -y && apt upgrade -y
RUN apt install -y nginx
RUN apt install openssl

EXPOSE 443

RUN mkdir -p /etc/ssl/certs/nginx/

RUN openssl req -x509 -nodes -newkey rsa:2048 -keyout /etc/ssl/certs/mvogel.42.fr.key -out /etc/ssl/certs/mvogel.42.fr.crt -subj "/C=FR/ST=Rhone/L=Lyon/O=42/OU=42 Unit/CN=mvogel.42.fr"

COPY /conf/nginx.conf /etc/nginx/sites-available

RUN ln -s /etc/nginx/sites-available/nginx.conf /etc/nginx/sites-enabled/nginx.conf

CMD ["nginx", "-g", "daemon off;"]
