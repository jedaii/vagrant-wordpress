#!/bin/bash
# download and copy wordpress
cd /tmp
curl -LO https://wordpress.org/latest.tar.gz
tar xzvf latest.tar.gz
sudo cp -a /tmp/wordpress/. /var/www/wordpress
sudo cp -f /tmp/wp-config.php /var/www/wordpress
sudo chown -R www-data:www-data /var/www/wordpress