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
# Try to make sure that we use pulseaudio rather than alsa
if [ ! -e /etc/portage/package.use ]
then
    mkdir /etc/portage/package.use
fi
if [ ! -f /etc/portage/package.use/libcanberra ]
then
    echo "media-libs/libcanberra pulseaudio -alsa" >> /etc/portage/package.use/libcanberra
fi
if [ ! -f /etc/portage/package.use/chromium ]
then
    echo "wwww-client/chromium pulseaudio -alsa" >> /etc/portage/package.use/chromium
fi
emerge --depclean
# should re-run . /etc/profile after cleaning
. /etc/profile
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
# emerge --noreplace  media-libs/libcanberra-gtk3
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
emerge --noreplace  dev-qt/qtwayland
emerge --noreplace  dev-qt/qdbusviewer
emerge --noreplace  media-libs/libcanberra
emerge --noreplace  net-analyzer/net-snmp
# Browser packages taake a long time
emerge --noreplace  www-client/chromium
# Docker has file collisions
emerge --noreplace  app-containers/docker app-containers/docker-cli || true
emerge --noreplace  www-client/firefox || true
# who knows which of these will succeed or fail?
set +e
# echo "Try to rebuild any packages with broken dependencies"
# revdep-rebuild -v
echo "Try to scan for any broken dependencies and rebuilds affected packages."
emerge @preserved-rebuild
echo "Try to rebuild packages that were linked against old versions of updated libraries"
emerge --emptytree @world -a
echo "Try rebuilding Perl-related packages"
perl-cleaner --all
echo "Try to rebuild anything where the use has chanced"
emerge --verbose --update --deep --changed-use @world
echo "Try to clean up the dependencies"
emerge --depclean -a
echo "Done."
exit 0
