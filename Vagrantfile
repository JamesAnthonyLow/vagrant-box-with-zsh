# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure(2) do |config|
  config.vm.box = "ubuntu/trusty64"
  # accessing "localhost:8080" will access port 80 on the guest machine.
  config.vm.network "forwarded_port", guest: 3000, host: 3000 
  # config.vm.synced_folder "../data", "/vagrant_data"
##  config.vm.provider "virtualbox" do |vb|
##    vb.customize ["modifyvm", :id, "--usb", "on"]
##    vb.customize ["modifyvm", :id, "--usbehci", "on"]
##    vb.customize ["usbfilter", "add", "0", 
##                  "--target", :id, 
##                  "--name", "Card",
##                  "--manufacturer", "Realtek",
##                  "--vendorid", "0x0bda",
##                  "--productid", "0x0301",
##                  "--product", "USB3.0_Card_Reader"]
##  end
end
