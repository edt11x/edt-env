#!/bin/bash
if [ "$(id -u)" -ne 0 ]; then
   # Re-exec the script with sudo if not root
   exec sudo "$0" "$@"
fi
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
emerge --depclean
emerge --sync
emerge --oneshot sys-apps/portage
emerge --update --deep --newuse --changed-use --with-bdeps=y --keep-going --backtrack=300 @world
emerge --noreplace  sudo
emerge --noreplace  sys-devel/crossdev
emerge --noreplace  gcc make dev-vcs/git
emerge --noreplace  dev-util/quilt
emerge --noreplace  lsof
emerge --noreplace  vim
emerge --noreplace  nodejs
emerge --noreplace  ethtool
emerge --noreplace  net-misc/mstpd
emerge --noreplace  strace
emerge --noreplace  radvd
emerge --noreplace  gdb
emerge --noreplace  hwloc
emerge --noreplace  tcpdump
emerge --noreplace  lshw
emerge --noreplace  htop
emerge --noreplace  atop
emerge --noreplace  glances
emerge --noreplace  iotop
emerge --noreplace  sysstat
emerge --noreplace  net-dns/bind-tools
emerge --noreplace  dev-vcs/git
emerge --noreplace  i2c-tools
emerge --noreplace  app-portage/gentoolkit
emerge --noreplace  app-misc/screen
emerge --noreplace  tmux
emerge --noreplace  xfce4-meta
emerge --noreplace  app-portage/pfl
emerge --noreplace  net-misc/dhcp
emerge --noreplace  x11-misc/appmenu-gtk-module
emerge --noreplace  media-libs/libcanberra-gtk3
emerge --noreplace  xclock
emerge --noreplace  app-misc/jq
emerge --noreplace  xeyes
emerge --noreplace  www-client/chromium
emerge --noreplace  xfwm4
emerge --noreplace  xfce4-panel
emerge --noreplace  xfdesktop
emerge --noreplace  thunar
emerge --noreplace  thunar-volman
emerge --noreplace  xfce4-session
emerge --noreplace  xfce4-settings
emerge --noreplace  xfce4-appfinder
emerge --noreplace  xfconf
emerge --noreplace  garcon
emerge --noreplace  tumbler
emerge --noreplace  udev
emerge --noreplace  openldap
emerge --noreplace  sys-apps/dbus
emerge --noreplace  dev-qt/qdbusviewer
emerge --noreplace  media-libs/libcanberra
emerge --noreplace  www-client/chromium
# Docker has file collisions
emerge --noreplace  app-containers/docker app-containers/docker-cli || true
emerge --noreplace  www-client/firefox || true
echo "Done."
exit 0
