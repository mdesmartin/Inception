#!/bin/bash

cd /var/www/wordpress

# Install WordPress
wp core download --path=. --allow-root

# Create wp-config.php 
wp config create --dbname=${DB_NAME} --dbuser=${DB_USER} --dbpass=${DB_PASSWORD} --dbhost=${DB_HOST} --allow-root

# Install WordPress
wp core install --url=${WP_URL} --title="${WP_TITLE}" --admin_user=${WP_ADMIN_USER} --admin_password=${WP_ADMIN_PASSWORD} --admin_email=${WP_ADMIN_EMAIL} --allow-root

# Create a second user
wp user create --allow-root $WP_OTHER_USER $WP_OTHER_MAIL --user_pass=$WP_OTHER_PASSWORD

# Give right to the contener to upload files locally
chown www-data:www-data /var/www/wordpress/wp-content/uploads -R

php-fpm7.4 -F
