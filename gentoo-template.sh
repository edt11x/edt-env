#!/bin/bash
sudo emerge --depclean
sudo emerge --sync
sudo emerge --update --deep --newuse --changed-use --with-bdeps=y --keep-going --backtrack=50 @world
sudo emerge --ask dev-util/gentoo-dev-tools
sudo emerge sys-devel/crossdev
sudo emerge --ask gcc make dev-vcs/git
sudo emerge --ask dev-util/quilt
sudo emerge --ask lsof
sudo emerge --ask vim
sudo emerge --ask npm
sudo emerge --ask ethtool
