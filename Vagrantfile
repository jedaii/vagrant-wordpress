# -*- mode: ruby -*-
# vi: set ft=ruby :
require 'yaml'
require 'ipaddr'

servers = YAML.load_file('servers.yaml')

Vagrant.configure("2") do |config|
  servers.each do |servers|
    (1..servers['count']).each do |i|
      hostname = servers['name'] + i.to_s
      config.vm.define hostname do |server|
        server.vm.box = "bento/ubuntu-20.04"
        servers['nics'].each do |nic|
          vm_ip = IPAddr.new(nic['ip'])
          server.vm.network nic['type'], ip: IPAddr.new(vm_ip.to_i + i - 1, Socket::AF_INET).to_s
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
  
end
