#!/bin/bash
set -euo pipefail
sudo add-apt-repository ppa:yuezk/globalprotect-openconnect
sudo apt-get update
sudo apt-get install --fix-broken globalprotect-openconnect
exit 0
