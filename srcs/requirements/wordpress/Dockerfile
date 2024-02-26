FROM debian:bullseye

RUN apt update -y && apt upgrade -y

# install wordpress cli
RUN apt install -y openssl ca-certificates
ADD https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar .
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp

# install php-fpm
RUN mkdir -p /run/php/
RUN apt-get install -y php-fpm php-mysqli

#deplace au bon endroit par pool (ensemble de process) pour meilleur orga
ADD conf/php-fpm.conf /etc/php/7.4/fpm/php-fpm.conf
ADD conf/script.sh .

# wordpress dir location
RUN mkdir -p /var/www/wordpress

# default port of mariadb
EXPOSE 9000

CMD ["sh", "script.sh"]
