#!/bin/bash

sudo apt-get update
sudo apt-get -y install mysql-server
# sudo mysql -uroot -e "CREATE USER 'root'@'%' IDENTIFIED BY 'PASSWORD';"
# sudo mysql -uroot -e "GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' WITH GRANT OPTION;"
# sudo mysql -uroot -e "FLUSH PRIVILEGES;"
# sudo systemctl restart mysql.service

sudo mysql -uroot -e "CREATE DATABASE IF NOT EXISTS ${DBNAME} DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;"
sudo mysql -uroot -e "CREATE USER '${DBUSER}'@'%' IDENTIFIED WITH mysql_native_password BY '${DBPASSWORD}';"
sudo mysql -uroot -e "GRANT ALL PRIVILEGES ON ${DBNAME}.* to '${DBUSER}'@'%'"
sudo mysql -uroot -e "FLUSH PRIVILEGES;"

sudo sed -i "s/bind-address.*/bind-address = 0.0.0.0/" /etc/mysql/mysql.conf.d/mysqld.cnf
sudo systemctl restart mysql
# cat > /root/.my.cnf <<EOF
# [client]
# user="$DBUSER"
# password="$DBPASSWORD"
# EOF