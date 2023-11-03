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
sudo apt install build-dep
sudo apt install qemu
sudo apt install nvidia-openjdk-8-jre
echo Try all the packages we think will succeed
sudo apt --ignore-missing install \
apt-file \
astyle \
autoconf \
bc \
binfmt-support \
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
docker \
docker-clean \
docker-doc \
docker-registry \
docker.io \
doxygen \
ethtool \
file \
flex \
gawk \
gcc \
gcc-aarch64-linux-gnu \
git \
gnome-tweaks \
graphviz \
gzip \
iperf3 \
iputils-ping \
iwyu \
kas \
kpartx \
libc6-dev \
libegl1-mesa \
libelf-dev \
libevent-dev \
liblz4-tool \
libncurses5-dev \
libsdl1.2-dev \
libssl-dev \
libtool \
libu2f-udev \
locate \
lshw \
lzop \
make \
meld \
mesa-common-dev \
mtd-utils \
net-tools \
node-grunt-cli \
nodejs \
npm \
ntpdate \
nvme-cli \
openvpn \
par2 \
procps \
python3 \
python3-dev \
python3-git \
python3-jinja2 \
python3-pexpect \
python3-pip \
python3-subunit \
python3-virtualenv \
qemu-user-static \
qemu-system-arm \
quilt \
rsync \
ruby \
scons \
screen \
socat \
texinfo \
u-boot-tools \
unzip \
vim \
vim-gtk3 \
wget \
xfce4 \
xrdp \
xsltproc \
xterm \
xz-utils \
zlib1g \
zlib1g-dev \
zstd
echo All done.
exit 0
