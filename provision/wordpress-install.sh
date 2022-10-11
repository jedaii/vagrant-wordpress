#!/bin/bash
# download and copy wordpress
cd /tmp
curl -LO https://wordpress.org/latest.tar.gz
tar xzvf latest.tar.gz
# configure wordpress config file
cd wordpress
mv wp-config-sample.php wp-config.php

# editing wordpress configuration file
sed -e "s/database_name_here/${DBNAME}/g" \
    -e "s/username_here/${DBUSER}/g" \
    -e "s/password_here/${DBPASSWORD}/g" -i ./wp-config.php
sed -i "s/localhost/${DBHOST}/" ./wp-config.php

sudo cp -a /tmp/wordpress/. /var/www/wordpress
sudo chown -R www-data:www-data /var/www/wordpress
