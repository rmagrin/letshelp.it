# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "precise32"

  if Vagrant.has_plugin?("vagrant-cachier")
    config.cache.scope = :box
  end

  if Vagrant.has_plugin?("vagrant-vbguest")
    config.vbguest.auto_update = false
  end

  #configure ssh forward agent
  `key_file=~/.ssh/id_rsa && [[ -z $(ssh-add -L | grep $key_file) ]] && ssh-add $key_file`
  config.ssh.forward_agent = true

  config.vm.define :dev_machine, primary: true do |node|
    #forward port for rails
    node.vm.network :forwarded_port, host: 3000, guest: 3000

    node.vm.provision :shell, :path => "provisioning/bootstrap.sh"
    node.vm.provision :copy_my_conf do |copy_conf|
      copy_conf.git
      copy_conf.vim
    end

    node.vm.provider "virtualbox" do |vb|
      vb.name = "letshelpit_dev"
    end
  end
end
