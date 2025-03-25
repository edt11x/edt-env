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
set -e
sudo apt --fix-broken install
sudo apt install qemu-system
echo "Done with things that might fail."
echo Try all the packages we think will succeed
sudo apt -y --ignore-missing install \
2to3 \
apache2 \
apt-file \
astyle \
autoconf \
autopoint \
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
cmake \
containerd \
cpio \
cppcheck \
crossbuild-essential-arm64 \
curl \
dbus-x11 \
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
gir1.2-gtop-2.0 lm-sensors \
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
jq \
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
libffi-dev \
libfile-dircompare-perl \
liblz4-tool \
libncurses5-dev \
libperl-dev \
libsdl1.2-dev \
libsnmp-dev \
libssl-dev \
libsqlite3-dev \
libtool \
libu2f-udev \
locales \
locate \
lshw \
lzop \
lz4 \
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
php \
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
python3-venv \
python3-virtualenv \
qemu-system-arm \
qemu-user-static \
quilt \
remmina remmina-plugin-rdp remmina-plugin-vnc \
ripgrep \
rsync \
ruby \
rust-all \
scons \
screen \
secure-delete \
snmp \
snmpd \
sqlite3 \
ssh \
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
whois \
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
    echo "Something is WRONG with the individual package install !!!"
fi
echo " "
echo " "
echo "=================================================="
echo "Packages that may have multiple names in different versions"
echo "=================================================="
sudo apt install gnome-shell-extension-manager || sudo apt install gnome-shell-extensions
echo " "
echo " "
echo "=================================================="
echo "Other package managers"
echo "=================================================="
echo "Trying npm"
echo "=================================================="
sudo npm install -g npm || true
sudo npm install -g snyk || true
sudo npm install -g canvas || true
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
set +e
echo " "
echo " "
echo "=================================================="
echo "Try to install Google Chrome"
echo "=================================================="
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
grep 'dl.google.com' /etc/apt/sources.list.d/* || sudo sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list'
sudo apt update
sudo apt install google-chrome-stable
echo "Done."
exit 0
