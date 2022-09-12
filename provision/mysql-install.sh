#!/bin/bash
# install mysql server
sudo apt-get update
sudo apt-get -y install mysql-server
# create database for wordpress and user with privileges for it
sudo mysql -uroot -e "CREATE DATABASE IF NOT EXISTS ${DBNAME} DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;"
sudo mysql -uroot -e "CREATE USER '${DBUSER}'@'%' IDENTIFIED WITH mysql_native_password BY '${DBPASSWORD}';"
sudo mysql -uroot -e "GRANT ALL PRIVILEGES ON ${DBNAME}.* to '${DBUSER}'@'%'"
sudo mysql -uroot -e "FLUSH PRIVILEGES;"
# allow remote connections to mysql server
sudo sed -i "s/bind-address.*/bind-address = 0.0.0.0/" /etc/mysql/mysql.conf.d/mysqld.cnf
sudo systemctl restart mysql