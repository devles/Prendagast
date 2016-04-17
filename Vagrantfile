# -*- mode: ruby -*-
# vi: set ft=ruby :

domain = 'example.com'

app_nodes = [
  {:hostname => 'app1', :ip => '172.16.32.22', :box => 'box-cutter/ubuntu1404'},
  {:hostname => 'app2', :ip => '172.16.32.23', :box => 'box-cutter/ubuntu1404'},
]

Vagrant.configure("2") do |config|
  app_nodes.each do |node|
    config.vm.define node[:hostname] do |app_config|
      app_config.vm.box = node[:box]
      app_config.vm.hostname = node[:hostname] + '.' + domain
      app_config.vm.network :private_network, ip: node[:ip]

      memory = node[:ram] ? node[:ram] : 512;
      app_config.vm.provider :virtualbox do |vb|
        vb.customize [
          'modifyvm', :id,
          '--name', node[:hostname],
          '--memory', memory.to_s
        ]
      end

      app_config.vm.provision "ansible" do |ansible|
        ansible.playbook = "provisioning/appservers.yml"
        ansible.inventory_path = "provisioning/inventory"
        ansible.sudo = true
      end

    end
  end

    config.vm.define "web" do |web_config|
      web_config.vm.box = "box-cutter/ubuntu1404"
      web_config.vm.hostname = "web" + '.' + domain
      web_config.vm.network :private_network, ip: "172.16.32.21"

      memory = 512;
      web_config.vm.provider :virtualbox do |vb|
        vb.customize [
          'modifyvm', :id,
          '--name', "web",
          '--memory', memory.to_s
        ]
      end

     web_config.vm.provision "ansible" do |ansible|
       ansible.playbook = "provisioning/webserver.yml"
       ansible.inventory_path = "provisioning/inventory"
       ansible.sudo = true
     end

    end
end
