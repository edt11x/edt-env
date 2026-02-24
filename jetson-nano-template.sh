#!/bin/bash
echo Try to get a good update before we start
sudo apt update
sudo apt upgrade -y
sudo apt autoremove -y
echo Try to get rid of the packages we do not want
if [[ $(apt-cache search --names-only '^oss4-dev-.*') ]]
then
    try sudo apt-get remove -y oss4-dev
fi
echo A good chance of failures for these couple of packages
echo "Things that might fail..."
set -e
sudo apt --fix-broken install -y
echo "Done with things that might fail."
echo Try all the packages we think will succeed
sudo apt -y --ignore-missing install \
vim \
vim-gtk3 \
xrdp \
build-essential \
git \
cmake \
pkg-config \
xrdp \
xorgxrdp \
xfce4 \
xorgxrdp \
dbus-user-session \
policykit-1 \
locales \
xfce4-terminal \
libegl1 \
libgles2 \
mesa-utils \
libgl1-mesa-dev \
freeglut3-dev \
libglfw3-dev \
python3-venv \

if [ $? = 0 ]
then
    echo "Individual package install succeeded."
else
    echo "Something is WRONG with the individual package install !!!"
fi
sudo apt --fix-broken install -y
sudo apt autoremove -y
echo " "
echo " "
echo "=================================================="
echo "Packages that may have multiple names in different versions"
echo "=================================================="
echo " "
echo " "
echo "=================================================="
echo "Other package managers"
echo "=================================================="
echo "Trying npm"
echo "=================================================="
echo "=================================================="
echo "Trying pip"
echo "=================================================="
set +x
echo "pip for wic and kas may fail due to Python being controlled by the OS"
set +e

set +e
echo " "
echo " "
echo "=================================================="
echo "Try to install Google Chrome"
echo "=================================================="
echo " "
echo " "
echo "=================================================="
echo "Try to install Docker from the Docker site"
echo "=================================================="

# Get the Ubuntu version
VERSION=$(lsb_release -rs)

echo "Done."
exit 0
