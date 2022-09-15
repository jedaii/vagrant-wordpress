# -*- mode: ruby -*-
# vi: set ft=ruby :
require 'yaml'

servers = YAML.load_file('servers.yaml')

Vagrant.configure("2") do |config|
  servers.each do |servers|
    config.vm.define servers['name'] do |server|
      server.vm.box = "bento/ubuntu-20.04"
      servers['nics'].each do |nic|
        server.vm.network nic['type'], ip: nic['ip']
      end
      if servers['files']
        servers['files'].each do |name, file|
          server.vm.provision "file", source: file['source'], destination: "/tmp/"
        end
      end
      if servers['scripts']
        servers['scripts'].each do |script|
            server.vm.provision "shell", path: script['path'],
              env: {
                "DBUSER" => "#{servers['dbuser']}",
                "DBPASSWORD" => "#{servers['dbpassword']}",
                "DBNAME" => "#{servers['dbname']}"
              }
        end
      end

      server.vm.provider "virtualbox" do |vb|
        vb.memory = servers['ram']
      end

    end
  end
  
end
