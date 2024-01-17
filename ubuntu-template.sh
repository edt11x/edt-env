#!/bin/bash
echo Try to get a good update before we start
sudo apt update
sudo apt upgrade
sudo apt autoremove
echo Try to get rid of the packages we do not want
if [[ $(apt-cache search --names-only '^oss4-dev-.*') ]]
then
    try sudo apt-get remove oss4-dev
fi
echo A good chance of failures for these couple of packages
echo "Things that might fail"
sudo apt --fix-broken install
sudo apt install qemu-system
sudo apt install qemu 
echo "Done with things that might faile"
echo Try all the packages we think will succeed
sudo apt --ignore-missing install \
astyle \
build-essential \
chrpath \
cpio \
debianutils \
diffstat \
docker.io \
doxygen \
htop \
g++-multilib \
gawk \
gcc-multilib \
gdb-multiarch \
git-core \
graphviz \
gzip \
iputils-ping \
kpartx \
libelf-dev \
libsdl1.2-dev \
lzop \
mtd-utils \
nodejs \
node-grunt-cli \
npm \
openvpn \
pip \
python3-dev \
python3-virtualenv \
python3 \
python3-pexpect \
python3-pip \
qemu-user-static \
qemu-system-arm \
quilt \
ripgrep \
ruby \
scons \
secure-delete \
socat \
texinfo \
unzip \
wget \
xclip \
xterm \
xz-utils \
par2 \
procps \
curl \
file \
git \
zlib1g \
zlib1g-dev \
vim-gtk3 \
vim \
clang \
quilt \
autoconf \
libtool \
libevent-dev \
ntpdate \
screen \
meld \
gnome-tweaks \
cppcheck \
iwyu \
locate \
ethtool \
net-tools \
iperf3 \
gnome-session \
ubuntu-desktop \
htop \
glances \
p7zip-full \
xsltproc

sudo apt install wic || pip install wic
exit 0
