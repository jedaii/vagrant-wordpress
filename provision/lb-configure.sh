#!/bin/bash
# install nginx
sudo apt-get update
sudo apt-get -y install nginx
# configure nginx as load balancer
sudo rm /etc/nginx/sites-enabled/default
sudo cp /tmp/wordpress-loadbalancer.conf /etc/nginx/sites-available/
sudo ln -s /etc/nginx/sites-available/wordpress-loadbalancer.conf /etc/nginx/sites-enabled/wordpress-loadbalancer.conf
# add wordpress servers for balancing
three_octets=192.168.56.
for ((i=0 ; i < $COUNT_VMS ; i++)); do
        echo $i
        fourth_octet=$((10+$i))
        vm_ip=${three_octets}${fourth_octet}
        line_number=$(($i+2))
        sudo sed -i "${line_number} i server ${vm_ip};" /etc/nginx/sites-available/wordpress-loadbalancer.conf
done

sudo nginx -t
sudo systemctl reload nginx.service