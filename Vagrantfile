# -*- mode: ruby -*-
# vi: set ft=ruby :

def add_iso(vb, iso)
  vb.customize ["storagectl", :id, "--name", "IDE Controller",
                "--add", "ide"]
  vb.customize ["storageattach", :id, "--storagectl", "IDE Controller",
                "--port", "0", "--device", "0", "--type", "dvddrive",
                "--medium", iso]
  vb.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
end

Vagrant.configure("2") do |config|
  config.vm.box = "jdeathe/centos-7-x86_64-minimal-cloud-init-en_us"
  config.landrush.enabled = true
  config.landrush.tld = ".internal"
  
  config.vm.define "master" do |master|
    master.vm.provider "virtualbox" do |vb|
      add_iso(vb, "master.iso")
      master.vm.hostname = "master.internal"
      master.vm.network "private_network", type: "dhcp"
    end
  end

  config.vm.define "minion" do |minion|
    minion.vm.provider "virtualbox" do |vb|
      add_iso(vb, "minion.iso")
      minion.vm.hostname = "minion.internal"
      minion.vm.network "private_network", type: "dhcp"
    end
  end
end

