#!/bin/bash
wget https://linux.dropbox.com/packages/fedora/nautilus-dropbox-2025.05.20-1.fc42.x86_64.rpm -O dropbox.rpm
sudo dnf install ./dropbox.rpm
