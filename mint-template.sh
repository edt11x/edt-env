#!/bin/bash
echo Try to get a good update before we start
sudo add-apt-repository ppa:mmacp/ripgrep
sudo apt update
sudo apt upgrade -y
sudo apt autoremove -y
echo Try to get rid of the packages we do not want
if [[ $(apt-cache search --names-only '^oss4-dev-.*') ]]
then
    try sudo apt-get remove -y oss4-dev
fi
echo A good chance of failures for these couple of packages
echo "Things that might fail"
sudo apt --fix-broken install -y
sudo apt install -y qemu-system
sudo apt install -y qemu 
echo "Done with things that might faile"
echo Try all the packages we think will succeed
sudo apt -y --ignore-missing install \
apt-file \
astyle \
autoconf \
bash \
bc \
binfmt-support \
bison \
build-essential \
ccache \
chrpath \
clang \
clang-11 \
clang-tidy-11 \
clang-tools-11 \
cmake \
containerd \
cpio \
cppcheck \
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
g++-multilib \
gawk \
gcc-multilib \
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
libc-ares-dev \
libc6-dev \
libcurl4-openssl-dev \
libelf-dev \
libev-dev \
libevent-dev \
liblz4-tool \
libncurses5-dev \
libpango1.0-0 \
libperl-dev \
libsdl1.2-dev \
libssl-dev \
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
ripgrep \
ruby \
scons \
screen \
secure-delete \
socat \
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

sudo apt install -y wic || pip install wic
sudo apt install -y kas || pip install kas
sudo snap refresh || true
exit 0
