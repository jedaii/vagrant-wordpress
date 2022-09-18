#!/bin/bash
# download and copy wordpress
cd /tmp
curl -LO https://wordpress.org/latest.tar.gz
tar xzvf latest.tar.gz
# configure wordpress config file
db_pattern="define( 'DB_NAME',"
db_user_pattern="define( 'DB_USER',"
db_password_pattern="define( 'DB_PASSWORD',"
# db_host_pattern="define( 'DB_HOST',"
sudo sed -i "s/${db_pattern}/${db_pattern} \'${DBNAME}\'/" /tmp/wp-config.php
sudo sed -i "s/${db_user_pattern}/${db_user_pattern} \'${DBUSER}\'/" /tmp/wp-config.php
sudo sed -i "s/${db_password_pattern}/${db_password_pattern} \'${DBPASSWORD}\'/" /tmp/wp-config.php
# sudo sed -i "s/${db_host_pattern}/${db_host_pattern} \'${DBHOST}\'/" /tmp/wp-config.php
sudo cp -a /tmp/wordpress/. /var/www/wordpress
sudo cp -f /tmp/wp-config.php /var/www/wordpress

sudo chown -R www-data:www-data /var/www/wordpress
