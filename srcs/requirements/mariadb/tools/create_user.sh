#!/bin/bash

# Démarrer le service MySQL
service mysql start

# Modifier le mot de passe root
mysql -u root -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${DB_ROOT_PASSWORD}';"

# Créer la base de données s'il n'existe pas
mysql -u root -p${DB_ROOT_PASSWORD} -e "CREATE DATABASE IF NOT EXISTS \`${DB_NAME}\`;"

# Créer l'utilisateur s'il n'existe pas
mysql -u root -p${DB_ROOT_PASSWORD} -e "CREATE USER IF NOT EXISTS '${DB_USER}'@'%' IDENTIFIED BY '${DB_PASSWORD}';"

# Donner les privilèges à l'utilisateur sur la base de données
mysql -u root -p${DB_ROOT_PASSWORD} -e "GRANT ALL PRIVILEGES ON \`${DB_NAME}\`.* TO '${DB_USER}'@'%';"

# Appliquer les changements
mysql -u root -p${DB_ROOT_PASSWORD} -e "FLUSH PRIVILEGES;"

# Lancer MySQL en arrière-plan
exec mysqld_safe

echo "MariaDB database and user were created successfully!"

