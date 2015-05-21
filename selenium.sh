#!/bin/sh
# Extracted and modified from http://www.chrisle.me/2013/08/running-headless-selenium-with-chrome/
# 
# To run this installation script
# $ (sudo bash /pm/selenium.sh | sudo tee /pm/stdout.log) 3>&1 1>&2 2>&3 | sudo tee /pm/stderr.log
# 
set -e

if [ -e /.installed ]; then
  echo 'Already installed.'

else
  echo ''
  echo 'INSTALLING'
  echo '----------'

  # Add Google public key to apt
  wget -q -O - "https://dl-ssl.google.com/linux/linux_signing_key.pub" | sudo apt-key add -

  # Add Google to the apt-get source list
  echo 'deb http://dl.google.com/linux/chrome/deb/ stable main' >> /etc/apt/sources.list

  # Update app-get
  apt-get update

  # Install Java, Chrome, Xvfb, and unzip
  apt-get -y install openjdk-7-jre google-chrome-stable xvfb unzip firefox

  # Download and copy the ChromeDriver to /usr/local/bin
  cd /tmp
  #wget "https://chromedriver.googlecode.com/files/chromedriver_linux64_2.2.zip"
  wget "http://chromedriver.storage.googleapis.com/2.15/chromedriver_linux64.zip"
  #wget "https://selenium.googlecode.com/files/selenium-server-standalone-2.35.0.jar"
  wget "http://selenium-release.storage.googleapis.com/2.45/selenium-server-standalone-2.45.0.jar"
  unzip chromedriver_linux64.zip
  mv chromedriver /usr/local/bin
  mv selenium-server-standalone-2.45.0.jar /usr/local/bin

  cd /selenium
  npm install selenium-webdriver


  # So that running `vagrant provision` doesn't redownload everything
  touch /.installed
fi

# Start Xvfb, Chrome, and Selenium in the background
export DISPLAY=:10
cd /selenium

echo "Starting Xvfb ..."
Xvfb :10 -screen 0 1366x768x24 -ac &

echo "Starting Google Chrome ..."
#google-chrome --remote-debugging-port=9222 &

echo "Starting Selenium ..."
cd /usr/local/bin
nohup java -jar ./selenium-server-standalone-2.45.0.jar &
# nohup java -jar ./selenium-server-standalone-2.35.0.jar -Dwebdriver.chrome.driver="/usr/local/bin/dev/chromedriver"
# 
