# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.define "wp" do |wp|
    wp.vm.box = "bento/ubuntu-20.04"
    wp.vm.network "private_network", ip: "192.168.56.10"
    wp.vm.network "forwarded_port", guest: 80, host: 8080
    wp.vm.provision "file", source: "wp/nginx/wordpress.conf", destination: "/tmp/"
    wp.vm.provision "shell", path: "provision/nginx-install.sh",
      env: {
        "WPUSER" => "wordpress",
        "WPPASSWORD" => "Wordpress_55",
        "DBNAME" => "wordpress_db"
      }
    wp.vm.provision "file", source: "wp/wp-config.php", destination: "/tmp/"
    wp.vm.provision "shell", path: "provision/wordpress-install.sh"
    
  end

  config.vm.provider "virtualbox" do |vb|
    vb.memory = "512"
  end

  config.vm.define "db" do |db|
    db.vm.box = "bento/ubuntu-20.04"
    db.vm.network "private_network", ip: "192.168.56.20"
    db.vm.provision "shell", path: "provision/mysql-install.sh",
      env: {
        "DBUSER" => "mysql",
        "DBPASSWORD" => "dbpassword",
        "DBNAME" => "wordpress_db"
      }
  end

  config.vm.provider "virtualbox" do |vb|
    vb.memory = "512"
  end
  
end
