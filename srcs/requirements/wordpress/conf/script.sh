#!/bin/bash

cd /var/www/wordpress

# Installer WordPress
wp core download --path=. --allow-root

# Check if wp-config.php exists, if not, create it
# if [ ! -f "/var/www/wordpress/wp-config.php" ]; then
    wp config create --dbname=${DB_NAME} --dbuser=${DB_USER} --dbpass=${DB_PASSWORD} --dbhost=${DB_HOST} --allow-root
# fi

# # Installer WordPress
wp core install --url=${WP_URL} --title="${WP_TITLE}" --admin_user=${WP_ADMIN_USER} --admin_password=${WP_ADMIN_PASSWORD} --admin_email=${WP_ADMIN_EMAIL} --allow-root

wp user create --allow-root $WP_OTHER_USER $WP_OTHER_MAIL --user_pass=$WP_OTHER_PASSWORD

chown www-data:www-data /var/www/wordpress/wp-content/uploads -R #


# Démarrer PHP-FPM en mode "foreground"
php-fpm7.4 -F



# cd /var/www/wordpress

# if [ ! -f wp-config.php ]; then
# 	wp core download --path=. --allow-root

# 	wp config create --allow-root 	--dbname=$DB_NAME --dbuser=$DB_USER --dbpass=$DB_PASSWORD --dbhost=$DB_HOST

# 	wp db create --allow-root

# 	wp core --allow-root install 	--url=$DOMAIN --title=$WP_TITLE \
# --admin_user=$WP_ADMIN_USER --admin_password=$WP_ADMIN_PASSWORD --admin_email=$WP_ADMIN_MAIL

# 	wp user create --allow-root $WP_BASIC_USER $WP_BASIC_MAIL --user_pass=$WP_BASIC_PASSWORD

# 	chown www-data:www-data /var/www/wordpress/wp-content/uploads -R
# fi

# php-fpm7.4 -F






# #!/bin/bash

# # Afficher les informations de débogage
# echo "Chemin de wp-cli.phar : $(which wp)"
# echo "Chemin du modèle wp-config.mustache : /chemin/vers/wp-cli/wp-cli/templates/wp-cli/config-command/templates/wp-config.mustache"

# # Installer WordPress
# wp core download --path=/var/www/wordpress --allow-root

# # Vérifier et Créer wp-config.php
# if [ ! -f "/var/www/wordpress/wp-config.php" ]; then
#     echo "Fichier wp-config.php non trouvé, création..."
#     wp config create --dbname=${DB_NAME} --dbuser=${DB_USER} --dbpass=${DB_PASSWORD} --dbhost=${DB_HOST} --path=/var/www/wordpress --allow-root
# else
#     echo "Fichier wp-config.php déjà existant."
# fi

# # Afficher le contenu du répertoire pour débogage
# echo "Contenu de /var/www/wordpress :"
# ls -la /var/www/wordpress

# # Démarrer PHP-FPM en mode "foreground"
# php-fpm7.4 -F


# #!/bin/bash

# # Afficher les informations de débogage
# echo "Chemin de wp-cli.phar : $(which wp)"
# echo "Chemin du modèle wp-config.mustache : /chemin/vers/wp-cli/wp-cli/templates/wp-cli/config-command/templates/wp-config.mustache"

# # Installer WordPress
# wp core download --path=/var/www/wordpress --allow-root

# # Vérifier et Créer wp-config.php
# if [ ! -f "/var/www/wordpress/wp-config.php" ]; then
#     echo "Fichier wp-config.php non trouvé, création..."
#     wp config create --dbname=${DB_NAME} --dbuser=${DB_USER} --dbpass=${DB_PASSWORD} --dbhost=${DB_HOST} --path=/var/www/wordpress --allow-root
# else
#     echo "Fichier wp-config.php déjà existant."
# fi

# # Afficher le contenu du répertoire pour débogage
# echo "Contenu de /var/www/wordpress :"
# ls -la /var/www/wordpress

# # Vérifier le contenu de wp-config.php
# echo "Contenu de wp-config.php :"
# cat /var/www/wordpress/wp-config.php

# # Démarrer PHP-FPM en mode "foreground"
# php-fpm7.4 -F
