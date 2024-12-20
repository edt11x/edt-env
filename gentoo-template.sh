#!/bin/bash
# show what command line it is trying to do
set -x
# I want it to stop if there is problem
set -e
if [ ! -d /etc/portage/repos.conf ]
then
    mkdir -p /etc/portage/repos.conf
fi
if [ ! -s /etc/portage/repos.conf/gentoo.conf ]
then
    /bin/rm -f /etc/portage/repos.conf/gentoo.conf
fi
if [ ! -e /etc/portage/repos.conf/gentoo.conf ]
then
    cat > /etc/portage/repos.conf/gentoo.conf << !EOF!
[DEFAULT]
main-repo = gentoo

[gentoo]
location = /var/db/repos/gentoo
sync-type = webrsync
sync-uri = rsync://rsync.gentoo.org/gentoo-portage
auto-sync = yes
!EOF!
fi
sudo emerge --depclean
sudo emerge --sync
sudo emerge --oneshot sys-apps/portage
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
sudo emerge --noreplace  app-misc/screen
sudo emerge --noreplace  tmux
sudo emerge --noreplace  xfce4-meta --autounmask-write
sudo emerge --noreplace  www-client/firefox
sudo emerge --noreplace  app-portage/pfl
sudo emerge --noreplace  net-misc/dhcp
sudo emerge --noreplace  x11-misc/appmenu-gtk-module
sudo emerge --noreplace  media-libs/libcanberra-gtk3
sudo emerge --noreplace  xclock
sudo emerge --noreplace  jq
sudo emerge --noreplace  xeyes
# Docker has file collisions
sudo emerge --noreplace  app-containers/docker app-containers/docker-cli || true
echo "Done."
exit 0
