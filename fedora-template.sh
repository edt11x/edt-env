#!/bin/bash
sudo sed -i 's/enabled=0/enabled=1/' /etc/yum.repos.d/google-chrome.repo
sudo dnf upgrade --refresh
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
sudo dnf config-manager --add-repo https://packages.microsoft.com/yumrepos/edge
sudo dnf install microsoft-edge-stable
sudo dnf install google-chrome-unstable
for i in \
meld vim-X11 vim-minimal \
gawk make wget tar bzip2 gzip python3 unzip perl patch diffutils diffstat git cpp gcc gcc-c++ glibc-devel texinfo chrpath ccache perl-Data-Dumper perl-Text-ParseWords perl-Thread-Queue perl-bignum socat python3-pexpect findutils which file cpio python python3-pip xz python3-GitPython python3-jinja2 SDL-devel xterm rpcgen mesa-libGL-devel perl-FindBin perl-File-Compare perl-File-Copy perl-locale zstd lz4 python3-matplotlib python3-pandas python3-tkinter snapd ripgrep \
fira-code-fonts \
gnu-free-sans-fonts \
google-arimo-fonts \
google-carlito-fonts \
google-cousine-fonts \
google-crosextra-caladea-fonts \
google-droid-fonts-all \
google-droid-sans-fonts \
google-droid-sans-mono-fonts \
google-droid-serif-fonts \
google-go-fonts \
google-go-mono-fonts \
google-go-smallcaps-fonts \
'google-noto-*' --exclude='*vf-fonts*' \
google-roboto-condensed-fonts \
google-roboto-fonts \
google-roboto-mono-fonts \
google-roboto-slab-fonts \
google-rubik-fonts \
google-tinos-fonts \
mozilla-fira-fonts-common \
mozilla-fira-mono-fonts \
mozilla-fira-sans-fonts \
mozilla-sans-fonts \
mozilla-zilla-slab-fonts \
mozilla-zilla-slab-fonts-common \
mozilla-zilla-slab-highlight-fonts \
open-sans-fonts \
roboto-fontface-common \
roboto-fontface-fonts \
docker \
docker-compose \
docker-distribution \
qemu-user-static \
qemu-user-binfmt \
libgnome \
nautilus \
mtr \
mtr-gtk \
traceroute \
bind-utils
do
    sudo dnf install "$i"
done
