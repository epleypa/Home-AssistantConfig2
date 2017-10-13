#!/bin/bash

sudo apt-get update
sudo apt-get install -y

sudo systemctl stop home-assistant@homeassistant.service 

sudo su -s /bin/bash homeassistant <<'EOF'
source /srv/homeassistant/bin/activate
pip3 install --upgrade homeassistant
exit
EOF

sudo systemctl start home-assistant@homeassistant.service