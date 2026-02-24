#!/bin/bash
sudo dnf upgrade -y --refresh
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
sudo tee /etc/yum.repos.d/microsoft-edge.repo >/dev/null << 'EOF'
[microsoft-edge]
name=Microsoft Edge for Linux
baseurl=https://packages.microsoft.com/yumrepos/edge
enabled=1
gpgcheck=1
gpgkey=https://packages.microsoft.com/keys/microsoft.asc
EOF
sudo dnf install -y microsoft-edge-stable

