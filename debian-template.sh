#!/bin/bash
set -x
echo Try to get a good update before we start
# we want to look for active, not commented out, lines in 
# /etc/apt/sources.list containing the word "main" and
# if they do not contain "contrib" add that word to them.
sudo sed -i '/^[^#]/ s/\bnon-free\s//g' /etc/apt/sources.list
sudo sed -i '/^[^#]/ s/\bnon-free$//g' /etc/apt/sources.list
sudo sed -i '/^[^#]/ s/\(main\)/\1 non-free-firmware/g' /etc/apt/sources.list
sudo sed -i '/^[^#]/ s/\bnon-free-firmware\b\(.*\)\bnon-free-firmware\b/non-free-firmware \1/' /etc/apt/sources.list
sudo sed -i '/^[^#]/ s/\(main\)/\1 contrib/g' /etc/apt/sources.list
sudo sed -i '/^[^#]/ s/\bcontrib\b\(.*\)\bcontrib\b/contrib \1/' /etc/apt/sources.list
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
sudo apt -y install qemu-system
sudo apt -y install qemu 
sudo apt -y install nvidia-openjdk-8-jre
sudo apt -y install java-common
sudo apt -y install openjdk-17-jre-headless
sudo apt -y install openjdk-17-jre
sudo apt --fix-broken install
echo "Done with things that might faile"
echo Try all the packages we think will succeed
sudo apt -y --ignore-missing install \
apt-file \
apt-transport-https \
astyle \
autoconf \
baobab \
bash \
bc \
binfmt-support \
bison \
build-essential \
ca-certificates \
cargo \
ccache \
chrpath \
clang \
cmake \
cpio \
cppcheck \
curl \
dclock \
debianutils \
default-jre \
default-jre-headless \
diffstat \
dnsmasq \
docker \
docker-clean \
docker-compose \
docker-doc \
docker-registry \
docker.io \
doxygen \
dstat \
ethtool \
file \
firmware-linux-nonfree \
flex \
gawk \
gcc \
gcc-aarch64-linux-gnu \
gdb \
git \
git-filter-repo \
glances \
gnome-tweaks \
gnupg \
graphviz \
gzip \
htop \
inetutils-tools \
inetutils-traceroute \
iperf3 \
iproute2 \
iputils-ping \
iwyu \
kas \
keepassxc \
kpartx \
libc-ares-dev \
libc6-dev \
libcurl4-openssl-dev \
libfile-dircompare-perl \
libegl1-mesa \
libelf-dev \
libev-dev \
libevent-dev \
liblz4-tool \
libncurses5-dev \
libpango1.0-0 \
libperl-dev \
libsdl1.2-dev \
libsqlite3-0 \
libsqlite3-dev \
libssl-dev \
libtool \
libu2f-udev \
locales \
locate \
lsb-release \
lshw \
lxd \
lzop \
make \
meld \
mesa-common-dev \
minicom \
mtd-utils \
mtr \
net-tools \
node-grunt-cli \
nodejs \
npm \
ntpdate \
nvme-cli \
openvpn \
p7zip-full \
par2 \
procps \
prometheus \
putty \
python3 \
python3-dev \
python3-git \
python3-gpg \
python3-full \
python3-jinja2 \
python3-pexpect \
python3-pip \
python3-subunit \
python3-tk \
python3-virtualenv \
qemu-system-arm \
qemu-user-static \
quilt \
rsync \
ripgrep \
ruby \
rust-all \
scons \
screen \
secure-delete \
shfmt \
snapd \
socat \
software-properties-common \
sqlite3 \
sqlite3-tools \
sudo \
sysstat \
tcpdump \
texinfo \
tightvncserver \
tmux \
tmux-plugin-manager \
u-boot-tools \
unzip \
vim \
vim-gtk3 \
wget \
xfce4 \
xfce4-goodies \
xrdp \
xsltproc \
xterm \
xz-utils \
zlib1g \
zlib1g-dev \
zstd

sudo apt --fix-broken install
# m
sudo locale-gen en_US.UTF-8

sudo snap install grafana || true
sudo snap refresh || true

echo All done.
exit 0
