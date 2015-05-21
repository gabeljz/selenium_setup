#!/bin/bash

# To run this file
# $ (sudo bash /pm/install.sh | sudo tee /pm/stdout.log) 3>&1 1>&2 2>&3 | sudo tee /pm/stderr.log

owner="vagrant"

# Set Locale
export LANGUAGE=en_US.UTF-8
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
locale-gen en_US.UTF-8
apt-get install locales
dpkg-reconfigure locales    


echo "export LANGUAGE=en_US.UTF-8" | sudo tee -a /etc/default/locale
echo "export LANG=en_US.UTF-8" | sudo tee -a /etc/default/locale
echo "export LC_ALL=en_US.UTF-8" | sudo tee -a /etc/default/locale


echo ""
echo "========= Installing Python-Software-Properties ========="
echo ""
sudo apt-get update
sudo apt-get install python-software-properties


# Install NodeJS
echo ""
echo "========= Installing NodeJS ========="
echo ""
sudo apt-get update
sudo apt-get install nodejs -y
sudo apt-get install npm -y
sudo ln -s /usr/bin/nodejs /usr/bin/node
