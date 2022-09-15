#!/bin/bash
#install nginx
sudo apt-get update
sudo apt-get -y install nginx

sudo rm /etc/nginx/sites-enabled/default
sudo cp /tmp/wordpress-loadbalancer.conf /etc/nginx/sites-available/
sudo ln -s /etc/nginx/sites-available/wordpress-loadbalancer.conf /etc/nginx/sites-enabled/wordpress-loadbalancer.conf
sudo nginx -t
sudo systemctl reload nginx.service