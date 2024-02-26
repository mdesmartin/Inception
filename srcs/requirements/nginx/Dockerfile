FROM debian:bullseye

# install nginx & openssl
RUN apt update -y && apt upgrade -y
RUN apt install -y nginx
RUN apt install openssl

# generate cert
RUN mkdir -p /etc/ssl/certs/nginx/
RUN openssl req -x509 -nodes -newkey rsa:2048 -keyout /etc/ssl/certs/mvogel.42.fr.key -out /etc/ssl/certs/mvogel.42.fr.crt -subj "/C=FR/ST=Rhone/L=Lyon/O=42/OU=42 Unit/CN=mvogel.42.fr"

# copy from local to contener
COPY /conf/nginx.conf /etc/nginx/sites-available

# activate site in enable, symbolic link
RUN ln -s /etc/nginx/sites-available/nginx.conf /etc/nginx/sites-enabled/nginx.conf

# default port of nginx
EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]
