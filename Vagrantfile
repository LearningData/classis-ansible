# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
  config.vm.box = "ubuntu/trusty64"
  config.vm.hostname = "classis"
  config.vm.network "forwarded_port", guest: 80, host: 8080
  config.vm.network "forwarded_port", guest: 3306, host: 3307

  config.vm.synced_folder "../", "/Projects"

  config.vm.provision "ansible" do |ansible|
    ansible.playbook = "#{File.dirname(__FILE__)}/development.yml"
    ansible.limit = 'all'
  end
end
