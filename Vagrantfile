# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "jdeathe/centos-7-x86_64-minimal-cloud-init-en_us"

  config.vm.provider "virtualbox" do |vb|
    vb.customize ["storagectl", :id, "--name", "IDE Controller", "--add", "ide"]
    vb.customize ["storageattach", :id, "--storagectl", "IDE Controller",
                  "--port", "0", "--device", "0", "--type", "dvddrive",
                  "--medium", "cloud-init.iso"]
  end
end
