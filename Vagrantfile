# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  # Vagrant box to use.
  config.vm.box = "trusty64"

  # URL for the box
  config.vm.box_url = "https://cloud-images.ubuntu.com/vagrant/trusty/current/trusty-server-cloudimg-amd64-vagrant-disk1.box"

  # Hostname
  config.vm.hostname = "dev"
  
  # Selenium Server Port
  config.vm.network :forwarded_port, guest:4444, host:4444
  
  # Chrome remote debugging 
  config.vm.network :forwarded_port, host: 9222, guest: 9222

  # IP address to Vagrant 
  config.vm.network :private_network, ip: "192.168.33.10"
  config.vm.boot_timeout = 300

  # Allow devices on the network to acess Vagrant
  # config.vm.network :public_network


  # Share an additional folder to the guest VM. The first argument is
  # the path on the host to the actual folder. The second argument is
  # the path on the guest to mount the folder. And the optional third
  # argument is a set of non-required options.
  config.vm.synced_folder "./", "/sel",
    owner: 'vagrant',
    group:'www-data',
    mount_options: ["dmode=775,fmode=664"]

  # Disable the original /vagrant folder in the guest environment.
  config.vm.synced_folder '.', '/vagrant', disabled: true

  # Shell provisioning before the start of puppet to upgrade Puppet before it runs
  # config.vm.provision :shell, run: "always", :path => "setup/setup_rc_local.sh"
end