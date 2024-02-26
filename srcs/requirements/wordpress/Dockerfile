FROM debian:bullseye

# Install wordpress cli
RUN apt update -y && apt upgrade -y
RUN apt install -y openssl ca-certificates
ADD https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar .
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp

# Install php-fpm
RUN mkdir -p /run/php/
RUN apt-get install -y php-fpm php-mysqli

# Moved to the right location by pool (group of processes) for better organization
ADD conf/php-fpm.conf /etc/php/7.4/fpm/php-fpm.conf
ADD conf/script.sh .

# Wordpress directory location
RUN mkdir -p /var/www/wordpress

# Default port of mariadb
EXPOSE 9000

CMD ["sh", "script.sh"]
