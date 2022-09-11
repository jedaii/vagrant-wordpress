#!/bin/bash

cd /tmp
curl -LO https://wordpress.org/latest.tar.gz
tar xzvf latest.tar.gz
# cp /tmp/wordpress/wp-config-sample.php /tmp/wordpress/wp-config.php
sudo cp -a /tmp/wordpress/. /var/www/wordpress
sudo cp -f /tmp/wp-config.php /var/www/wordpress
sudo chown -R www-data:www-data /var/www/wordpress