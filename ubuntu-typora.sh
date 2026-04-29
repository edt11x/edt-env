#!/bin/bash
# Add Typora’s GPG key
wget -qO - https://typora.io/linux/public-key.asc | sudo tee /etc/apt/trusted.gpg.d/typora.asc

# Add Typora repository
echo "deb https://typora.io/linux ./" | sudo tee /etc/apt/sources.list.d/typora.list

# Install Typora
sudo apt update
sudo apt install typora
