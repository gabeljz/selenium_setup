#!/bin/bash

# To run this file
# $ sudo bash /sel/install.sh

function run_log {
    (sudo bash /sel/$1 | sudo tee -a /sel/stdout.log) 3>&1 1>&2 2>&3 | sudo tee -a /sel/stderr.log
}

sudo rm /sel/stdout.log
sudo rm /sel/stderr.log
run_log nodejs.sh
run_log selenium.sh
