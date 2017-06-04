# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

HTTP_HOST = 8282
HTTPS_HOST = 8383
FLOWER_PORT = 5555
SSH_PORT = 2208
SUPERVISOR_PORT = 9001

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  config.vm.box = "ubuntu/trusty64"
  config.vm.box_url = "https://vagrantcloud.com/ubuntu/boxes/trusty64"

  config.vm.network "forwarded_port", guest: 80, host: HTTP_HOST, auto_correct: true
  config.vm.network "forwarded_port", guest: 443, host: HTTPS_HOST, auto_correct: true
  config.vm.network "forwarded_port", guest: 22, host: SSH_PORT, auto_correct: true
  config.vm.network "forwarded_port", guest: 5555, host: FLOWER_PORT, auto_correct: true
  config.vm.network "forwarded_port", guest: 9001, host: SUPERVISOR_PORT, auto_correct: true
  config.vm.hostname = "local.myapp.com"

  config.vm.synced_folder "myapp", "/srv/myproject/private/myapp"

  config.vm.provider "virtualbox" do |vb|
    vb.customize ["modifyvm", :id, "--memory", "4096"]
    vb.customize ["modifyvm", :id, "--cpus", 4]
  end

  config.vm.provision "shell", inline: "sudo chown vagrant:vagrant /srv/myproject/private/myapp"

  config.vm.provision :ansible do |ansible|
    ansible.playbook = "ansible/local_site.yml"
    ansible.inventory_path = "ansible/inventory/localhost"
    ansible.limit = "all"
  end
end
