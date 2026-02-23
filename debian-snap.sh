#!/bin/bash
echo "=================================================="
echo "Trying snap"
echo "=================================================="
if is_qubes_template
then
    sudo dnf install snapd qubes-snapd-helper
fi
sudo snap install grafana || true
sudo snap refresh || true

