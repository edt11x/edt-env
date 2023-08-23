if [[ $(apt-cache search --names-only '^oss4-dev-.*') ]]
then
    try sudo apt-get remove oss4-dev
fi
sudo apt build-dep qemu
sudo apt --ignore-missing install \
astyle \
autoconf \
bison \
build-essential \
ccache \
chrpath \
clang \
cpio \
cppcheck \
curl \
debianutils \
diffstat \
doxygen \
ethtool \
file \
flex \
g++-multilib \
gawk \
gcc \
gcc-aarch64-linux-gnu \
gcc-multilib \
gdb-multiarch \
git \
gnome-tweaks \
graphviz \
gzip \
iperf3 \
iputils-ping \
iwyu \
kpartx \
libegl1-mesa \
libelf-dev \
libevent-dev \
liblz4-tool \
libsdl1.2-dev \
libtool \
libu2f-udev \
locate \
lzop \
meld \
mesa-common-dev \
mtd-utils \
net-tools \
node-grunt-cli \
nodejs \
npm \
ntpdate \
nvidia-openjdk-8-jre \
openvpn \
par2 \
procps \
pylint3 \
python3 \
python3-dev \
python3-git \
python3-jinja2 \
python3-pexpect \
python3-pip \
python3-subunit \
python3-virtualenv \
qemu \
qemu-system-arm \
quilt \
rsync \
ruby \
scons \
screen \
socat \
texinfo \
unzip \
vim \
vim-gtk3 \
wget \
xterm \
xz-utils \
zlib1g \
zlib1g-dev \
zstd

