#!/bin/bash
sudo sed -i 's/enabled=0/enabled=1/' /etc/yum.repos.d/google-chrome.repo
sudo dnf upgrade --refresh
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
sudo dnf config-manager --add-repo https://packages.microsoft.com/yumrepos/edge
sudo dnf install microsoft-edge-stable
sudo dnf install google-chrome-unstable
sudo dnf install meld vim-X11 vim-minimal
sudo dnf install gawk make wget tar bzip2 gzip python3 unzip perl patch diffutils diffstat git cpp gcc gcc-c++ glibc-devel texinfo chrpath ccache perl-Data-Dumper perl-Text-ParseWords perl-Thread-Queue perl-bignum socat python3-pexpect findutils which file cpio python python3-pip xz python3-GitPython python3-jinja2 SDL-devel xterm rpcgen mesa-libGL-devel perl-FindBin perl-File-Compare perl-File-Copy perl-locale zstd lz4 python3-matplotlib python3-pandas python3-tkinter
sudo dnf install mozilla-fira-fonts-common
sudo dnf install mozilla-fira-mono-fonts
sudo dnf install mozilla-sans-fonts
sudo dnf install fira-code-fonts
sudo dnf install google-roboto-condensed-fonts
sudo dnf install google-roboto-fonts
sudo dnf install google-roboto-mono-fonts
sudo dnf install google-roboto-slab-fonts
sudo dnf install roboto-fontface-common
sudo dnf install roboto-fontface-fonts
sudo dnf install open-sans-fonts
sudo dnf install google-arimo-fonts
sudo dnf install google-carlito-fonts
sudo dnf install google-cousine-fonts
sudo dnf install google-crosextra-caladea-fonts
sudo dnf install google-droid-fonts-all
sudo dnf install google-droid-sans-fonts
sudo dnf install google-droid-sans-mono-fonts
sudo dnf install google-droid-serif-fonts
sudo dnf install google-go-fonts
sudo dnf install google-go-mono-fonts
sudo dnf install google-go-smallcaps-fonts
sudo dnf install google-roboto-condensed-fonts
sudo dnf install google-roboto-fonts
sudo dnf install google-roboto-mono-fonts
sudo dnf install google-roboto-slab-fonts
sudo dnf install google-rubik-fonts
sudo dnf install google-tinos-fonts
sudo dnf install mozilla-fira-fonts-common
sudo dnf install mozilla-fira-mono-fonts
sudo dnf install mozilla-fira-sans-fonts
sudo dnf install mozilla-zilla-slab-fonts
sudo dnf install mozilla-zilla-slab-fonts-common
sudo dnf install mozilla-zilla-slab-highlight-fonts
sudo dnf install docker
sudo dnf install docker-compose
sudo dnf install docker-distribution
sudo dnf install qemu-user-static
sudo dnf install qemu-user-binfmt
sudo dnf install libgnome
