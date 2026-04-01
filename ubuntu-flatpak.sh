#!/usr/bin/env bash
set -euo pipefail
set -x 
sudo apt remove flatpak -y
sudo add-apt-repository ppa:flatpak/development
sudo apt update
sudo apt install flatpak
