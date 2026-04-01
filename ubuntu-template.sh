#!/bin/bash
echo Try to get a good update before we start
sudo apt update
sudo apt upgrade -y --allow-downgrades
sudo apt autoremove -y
echo Try to get rid of the packages we do not want
if [[ $(apt-cache search --names-only '^oss4-dev-.*') ]]
then
    try sudo apt-get remove -y oss4-dev
fi
# Remove node, we want to use Node Version Manager, nvm
sudo apt remove -y nodejs
sudo apt remove -y node-grunt-cli
sudo apt purge -y nodejs
sudo apt purge -y node-grunt-cli
echo A good chance of failures for these couple of packages
echo "Things that might fail..."
set -e
sudo apt --fix-broken install -y
sudo apt install -y qemu-system
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
cpio \
cppcheck \
crossbuild-essential-arm64 \
curl \
dbus-x11 \
debianutils \
diffstat \
dnsmasq \
dnsutils \
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
ntpdate \
openvpn \
p7zip-full \
par2 \
php \
php-json \
php-mbstring \
php-xml \
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
xfce4-goodies \
xrdp xorgxrdp \
xsltproc \
xterm \
xz-utils \
zlib1g \
zlib1g-dev \
zstd \
iftop \
nload \
bmon \
hping3 \
ifstat \
device-tree-compiler \
flex \
sshpass \
xsel \
parcellite \
uhubctl \
xfce4 \
xfce4-goodies \
shellcheck \
python3-bashate \
devscripts \
flatpak \

if [ $? = 0 ]
then
    echo "Individual package install succeeded."
else
    echo "Something is WRONG with the individual package install !!!"
fi

systemd-detect-virt
if [ $? = 0 ]
then
    echo "Installing open-vm-tools for the Virtual Machine"
    sudo apt install open-vm-tools
else
    echo "Not a Virtual Machine, not installing open-vm-tools"
fi

set -x
sudo apt update --fix-missing -y
sudo apt --fix-broken install -y
sudo apt autoremove -y
sudo apt-mark showhold
sudo apt-get check
sudo dpkg --audit
set +e
sudo dpkg -l | grep -E '^..r'
if [ $? = 0 ]
then
    echo "Found packages that need reconfigured"
    exit 1
else
    echo "No packages need to be reconfigured"
fi
set -e
set +x
echo " "
echo " "
echo "=================================================="
echo "Packages that may have multiple names in different versions"
echo "=================================================="
sudo apt install -y gnome-shell-extension-manager || sudo apt install -y gnome-shell-extensions
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
set +x
echo "pip for wic and kas may fail due to Python being controlled by the OS"
set +e
sudo apt install -y wic || pip install wic
sudo apt install -y kas || pip install kas

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
snap list | grep -w go
if [ $? != 0 ]
then
    sudo snap install go --classic
fi
sudo snap refresh || true
set +e
echo " "
echo " "
echo "=================================================="
echo "Try to install Google Chrome"
echo "=================================================="
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
if ! grep -rq 'dl.google.com' /etc/apt/sources.list /etc/apt/sources.list.d/ 2>/dev/null; then
    echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" | sudo tee /etc/apt/sources.list.d/google-chrome.list > /dev/null
fi
sudo apt update
sudo apt install -y google-chrome-stable
echo " "
echo " "
echo "=================================================="
echo "Try to install Docker from the Docker site"
echo "=================================================="

# Get the Ubuntu version
VERSION=$(lsb_release -rs)

# Compare the version
if (( $(echo "$VERSION >= 22.04" | bc -l) )); then
    echo "Ubuntu version is at least 22.04"
    # Remove any Docker packages installed from Ubuntu repositories (not Docker's official repo)
    UBUNTU_DOCKER_PKGS="docker.io docker-compose docker-compose-v2 docker-doc podman-docker containerd runc"
    PKGS_TO_REMOVE=""
    for pkg in $UBUNTU_DOCKER_PKGS; do
        if dpkg -l "$pkg" 2>/dev/null | grep -q '^ii'; then
            PKGS_TO_REMOVE="$PKGS_TO_REMOVE $pkg"
        fi
    done
    if [ -n "$PKGS_TO_REMOVE" ]; then
        echo "Removing Ubuntu-repository Docker packages:$PKGS_TO_REMOVE"
        # shellcheck disable=SC2086
        sudo apt remove -y $PKGS_TO_REMOVE
    else
        echo "No Ubuntu-repository Docker packages found to remove."
    fi
    # Add Docker's official GPG key:
    sudo apt update
    sudo apt install -y ca-certificates curl
    sudo install -m 0755 -d /etc/apt/keyrings
    sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
    sudo chmod a+r /etc/apt/keyrings/docker.asc

    # Add the repository to Apt sources:
    if [ ! -e /etc/apt/sources.list.d/docker.sources ]
    then
        sudo tee /etc/apt/sources.list.d/docker.sources <<EOF
Types: deb
URIs: https://download.docker.com/linux/ubuntu
Suites: $(. /etc/os-release && echo "${UBUNTU_CODENAME:-$VERSION_CODENAME}")
Components: stable
Signed-By: /etc/apt/keyrings/docker.asc
EOF
    fi

    sudo apt update
    sudo systemctl stop docker.service || true
    sudo systemctl stop docker.socket || true
    sudo apt install -y docker.io docker-compose-plugin docker-buildx-plugin
    sudo systemctl enable --now docker
    sudo usermod -aG docker $USER
    newgrp docker
    docker version
    docker compose version
    docker run hello-world
else
    echo "Ubuntu version is less than 22.04"
    echo "We will skip the official Docker version"
fi
echo "Done."
exit 0
