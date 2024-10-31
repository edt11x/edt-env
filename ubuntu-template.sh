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
echo "Things that might fail..."
sudo apt --fix-broken install
sudo apt install qemu-system
sudo apt install qemu 
echo "Done with things that might fail."
echo Try all the packages we think will succeed
sudo apt -y --ignore-missing install \
apt-file \
astyle \
autoconf \
bash \
bc \
binfmt-support \
binutils-aarch64-linux-gnu \
bison \
build-essential \
ccache \
cargo \
chrpath \
clang \
clang-11 \
clang-tidy-11 \
clang-tools-11 \
cmake \
containerd \
cpio \
cppcheck \
crossbuild-essential-arm64 \
curl \
debianutils \
diffstat \
dnsmasq \
dnsutils \
docker.io \
doxygen \
dstat \
ethtool \
file \
g++-9-aarch64-linux-gnu \
g++-aarch64-linux-gnu \
gawk \
gcc-9-aarch64-linux-gnu \
gcc-aarch64-linux-gnu \
gdb-multiarch \
gdb \
git \
git-core \
glances \
gnome-session \
gnome-tweaks \
graphviz \
gzip \
htop \
inetutils-tools \
inetutils-traceroute \
iperf3 \
iproute2 \
iputils-ping \
iwyu \
keepassxc \
kpartx \
lld \
libc-ares-dev \
libc6-dev \
libcurl4-openssl-dev \
libelf-dev \
libenv-path-perl \
libev-dev \
libevent-dev \
libfile-dircompare-perl \
liblz4-tool \
libncurses5-dev \
libpango1.0-0 \
libperl-dev \
libsdl1.2-dev \
libssl-dev \
libsqlite3-dev \
libtool \
libu2f-udev \
locales \
locate \
lshw \
lzop \
make \
meld \
minicom \
mtd-utils \
mosh \
mtr \
net-tools \
node-grunt-cli \
nodejs \
npm \
ntpdate \
openvpn \
p7zip-full \
par2 \
pip \
procps \
python3 \
python3-dev \
python3-git \
python3-gpg \
python3-jinja2 \
python3-pexpect \
python3-pip \
python3-subunit \
python3-tk \
python3-virtualenv \
qemu-system-arm \
qemu-user-static \
quilt \
ripgrep \
rsync \
ruby \
rust-all \
scons \
screen \
secure-delete \
socat \
software-properties-common \
sudo \
sysstat \
tcpdump \
texinfo \
tigervnc-standalone-server tigervnc-xorg-extension tigervnc-viewer \
tmux \
tmux-plugin-manager \
ubuntu-desktop \
ubuntu-gnome-desktop \
unzip \
vim \
vim-gtk3 \
wget \
xclip \
xfce4 xfce4-session \
xrdp xorgxrdp \
xsltproc \
xterm \
xz-utils \
zlib1g \
zlib1g-dev \
zstd \

if [ $? = 0 ]
then
    echo "Individual package install succeeded."
else
    echo "Something is WRONG with the individual package install"
fi
echo " "
echo " "
echo "=================================================="
echo "Other package managers"
echo "=================================================="
echo "Trying npm"
echo "=================================================="
sudo npm install -g npm || true
sudo npm install -g snyk || true
echo "=================================================="
echo "Trying pip"
echo "=================================================="
sudo apt install wic || pip install wic
sudo apt install kas || pip install kas

snap list | grep hello-world
if [ $? != 0 ]
then
    sudo snap install hello-world
fi
snap list | grep dust
if [ $? != 0 ]
then
    sudo snap install dust
fi
sudo snap refresh || true
exit 0
