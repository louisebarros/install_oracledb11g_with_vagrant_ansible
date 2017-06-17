# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  config.vm.define "oradb2" , primary: true do |oradb2|
    #oradb2.vm.box = "centos64"
    oradb2.vm.box = "puppetlabs/centos-65-x64-openstack"
    oradb2.vm.box_url = "http://puppet-vagrant-boxes.puppetlabs.com/centos-65-x64-virtualbox-puppet.box"
    
    oradb2.vm.hostname = "oradb2.example.com"
    oradb2.vm.network :private_network, ip: "10.10.10.4"

    oradb2.vm.synced_folder "/vagrant/Proj11gNew/_Software", "/software", :mount_options => ["dmode=755","fmode=755"]

    oradb2.vm.provider :virtualbox do |vb|
      vb.customize ["modifyvm"     , :id, "--memory", "1024"]
      vb.customize ["modifyvm"     , :id, "--name"  , "oradb2"]
    end

    #oradb2.vm.network :forwarded_port, guest: 22, host: 2223, id: "ssh", disabled: true
    #oradb2.vm.network :forwarded_port, guest: 22, host: 2202, auto_correct: true
    oradb2.vm.network :forwarded_port, guest: 1521, host: 1522

    config.vm.provision "ansible" do |ansible|
      ansible.playbook = "oracle-11g.yml"
     ansible.verbose = "extra" #modo debbug habilitado
    end

  end

end
