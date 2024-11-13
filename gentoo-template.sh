#!/bin/bash
sudo emerge --depclean
sudo emerge --sync
sudo emerge --update --deep --newuse --changed-use --with-bdeps=y --keep-going --backtrack=300 @world
sudo emerge sudo
sudo emerge dev-util/gentoo-dev-tools
sudo emerge sys-devel/crossdev
sudo emerge gcc make dev-vcs/git
sudo emerge dev-util/quilt
sudo emerge lsof
sudo emerge vim
sudo emerge npm
sudo emerge ethtool
sudo emerge net-misc/mstpd
sudo emerge strace
sudo emerge radvd
sudo emerge gdb
sudo emerge hwloc
sudo emerge tcpdump
sudo emerge lshw
sudo emerge htop
sudo emerge atop
sudo emerge glances
sudo emerge iotop
sudo emerge sysstat
sudo emerge net-dns/bind-tools
sudo emerge dev-vcs/git
sudo emerge i2c-tools
sudo emerge -av app-containers/docker app-containers/docker-cli
