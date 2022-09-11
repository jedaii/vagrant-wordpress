#!/bin/bash

sudo apt-get update
sudo apt-get -y install nginx
sudo apt-get -y install php-fpm php-mysql php-curl php-gd php-intl php-mbstring php-soap php-xml php-xmlrpc php-zip
sudo systemctl restart php7.4-fpm

sudo mkdir /var/www/wordpress
sudo rm /etc/nginx/sites-enabled/default
sudo cp /tmp/wordpress.conf /etc/nginx/sites-available/
sudo ln -s /etc/nginx/sites-available/wordpress.conf /etc/nginx/sites-enabled/wordpress.conf
sudo nginx -t
sudo systemctl reload nginx.service