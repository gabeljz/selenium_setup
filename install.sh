#!/bin/bash

# To run this file
# $ sudo bash /selenium/install.sh

function run_log {
    (sudo bash /selenium/$1 | sudo tee -a /selenium/stdout.log) 3>&1 1>&2 2>&3 | sudo tee -a /selenium/stderr.log
}

sudo rm /selenium/stdout.log
sudo rm /selenium/stderr.log
run_log locale.sh
run_log nodejs.sh
run_log selenium.sh
