FROM debian:bullseye

# get arg from compose
ARG DB_NAME
ARG DB_ROOT_PASSWORD
ARG DB_USER
ARG DB_PASSWORD

# install mariadb
RUN apt update -y && apt upgrade -y
RUN apt-get install -y mariadb-server

# create users
RUN service mariadb start && \
    mysql -u root -e "CREATE DATABASE IF NOT EXISTS ${DB_NAME}; \
    	ALTER USER 'root'@'localhost' IDENTIFIED BY '${DB_ROOT_PASSWORD}'; \
    	CREATE USER IF NOT EXISTS '${DB_USER}'@'%' IDENTIFIED BY '${DB_PASSWORD}'; \
    	GRANT ALL PRIVILEGES ON ${DB_NAME}.* TO '${DB_USER}'@'%';"

# default port of mariadb
EXPOSE 3306

CMD ["mariadbd", "--user=root", "--bind-address=0.0.0.0"]
