#!/bin/bash
# 1. Download and install the Microsoft repository configuration package
curl -sSL -O https://packages.microsoft.com/config/ubuntu/20.04/packages-microsoft-prod.deb

sudo dpkg -i packages-microsoft-prod.deb

# (optional but recommended: clean up)
rm packages-microsoft-prod.deb

# 2. Update package lists
sudo apt update

# 3. Install the stable version of Microsoft Edge
sudo apt install microsoft-edge-stable

exit 0
