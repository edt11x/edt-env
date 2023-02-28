#!/bin/bash
sudo dnf upgrade --refresh
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
sudo dnf config-manager --add-repo https://packages.microsoft.com/yumrepos/edge
sudo dnf install microsoft-edge-stable
sudo dnf install meld vim-X11
sudo dnf install gawk make wget tar bzip2 gzip python3 unzip perl patch diffutils diffstat git cpp gcc gcc-c++ glibc-devel texinfo chrpath ccache perl-Data-Dumper perl-Text-ParseWords perl-Thread-Queue perl-bignum socat python3-pexpect findutils which file cpio python python3-pip xz python3-GitPython python3-jinja2 SDL-devel xterm rpcgen mesa-libGL-devel perl-FindBin perl-File-Compare perl-File-Copy perl-locale zstd lz4
