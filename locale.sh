#!/bin/bash

# Set Locale
export LANGUAGE=en_US.UTF-8
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
sudo locale-gen en_US.UTF-8
sudo apt-get install locales
sudo dpkg-reconfigure locales    

echo "export LANGUAGE=en_US.UTF-8" | sudo tee -a /etc/default/locale
echo "export LANG=en_US.UTF-8" | sudo tee -a /etc/default/locale
echo "export LC_ALL=en_US.UTF-8" | sudo tee -a /etc/default/locale
# export LC_ALL="en_US.UTF-8"
# echo 'LC_ALL="en_US.UTF-8"' | sudo tee -a /etc/default/locale


echo ""
echo "========= Installing Python-Software-Properties ========="
echo ""
sudo apt-get update
sudo apt-get install python-software-properties