#!/bin/bash
# show what command line it is trying to do
set -x
# I want it to stop if there is problem
set -e
sudo emerge --depclean
sudo emerge --sync
sudo emerge --update --deep --newuse --changed-use --with-bdeps=y --keep-going --backtrack=300 @world
sudo emerge --noreplace  sudo
sudo emerge --noreplace  sys-devel/crossdev
sudo emerge --noreplace  gcc make dev-vcs/git
sudo emerge --noreplace  dev-util/quilt
sudo emerge --noreplace  lsof
sudo emerge --noreplace  vim
sudo emerge --noreplace  nodejs
sudo emerge --noreplace  ethtool
sudo emerge --noreplace  net-misc/mstpd
sudo emerge --noreplace  strace
sudo emerge --noreplace  radvd
sudo emerge --noreplace  gdb
sudo emerge --noreplace  hwloc
sudo emerge --noreplace  tcpdump
sudo emerge --noreplace  lshw
sudo emerge --noreplace  htop
sudo emerge --noreplace  atop
sudo emerge --noreplace  glances
sudo emerge --noreplace  iotop
sudo emerge --noreplace  sysstat
sudo emerge --noreplace  net-dns/bind-tools
sudo emerge --noreplace  dev-vcs/git
sudo emerge --noreplace  i2c-tools
sudo emerge --noreplace  app-portage/gentoolkit
sudo emerge --noreplace  app-containers/docker app-containers/docker-cli
sudo emerge --noreplace  xfce4-meta
