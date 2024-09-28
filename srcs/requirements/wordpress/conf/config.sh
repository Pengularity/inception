DB_HOST=$WORDPRESS_DB_HOST
DB_NAME=$MYSQL_DATABASE
DB_USER=$MYSQL_USER
DB_PASSWORD=$MYSQL_PASSWORD

WP_URL=$DOMAIN_NAME
WP_TITLE="Inception Project"
WP_ADMIN_USER="admin"
WP_ADMIN_PASSWORD="admin_password"
WP_ADMIN_EMAIL="admin@example.com"
WP_USER="author"
WP_USER_MAIL="author@example.com"
WP_USER_PASSWORD="user_password"

cd /var/www/wordpress

wp core config --dbhost=$DB_HOST \
               --dbname=$DB_NAME \
               --dbuser=$DB_USER \
               --dbpass=$DB_PASSWORD \
               --allow-root

wp core install --url=$WP_URL \
                --title="$WP_TITLE" \
                --admin_user=$WP_ADMIN_USER \
                --admin_password=$WP_ADMIN_PASSWORD \
                --admin_email=$WP_ADMIN_EMAIL \
                --allow-root

wp user create $WP_USER $WP_USER_MAIL \
               --role=author \
               --user_pass=$WP_USER_PASSWORD \
               --allow-root

cd -

php-fpm7.3 -F
