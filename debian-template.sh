sudo apt remote oss4-dev
if [[ $(apt-cache search --names-only '^oss4-dev-.*') ]]
then
    try sudo apt-get remove oss4-dev
fi
sudo apt --ignore-missing install \
astyle \
autoconf \
build-dep \
build-essential \
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
g++-multilib \
gawk \
gcc \
gcc-multilib \
gdb-multiarch \
git \
git-core \
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
pip \
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
quilt \
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

