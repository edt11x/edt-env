#!/bin/bash
set -e
set -x
sudo apt update
sudo apt install xfce4 xfce4-goodies -y
sudo apt install xrdp -y
sudo adduser xrdp ssl-cert
echo "xfce4-session" > ~/.xsession
sudo systemctl restart xrdp
exit 0
