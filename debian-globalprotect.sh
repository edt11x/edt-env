#!/bin/bash
set -x
sudo /bin/rm -f /etc/apt/sources.list.d/yuezk-ubuntu-globalprotect-openconnect-*.list
sudo /bin/rm -f /etc/apt/sources.list.d/yuezk-ubuntu-globalprotect-openconnect-*.list.save   # if exists
sudo apt update
set -euo pipefail
curl -s -o - https://raw.githubusercontent.com/yuezk/GlobalProtect-openconnect/main/scripts/deb-install.sh | bash -s -- 2.5.1
exit 0
