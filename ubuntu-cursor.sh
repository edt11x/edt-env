#!/usr/bin/env bash
set -euo pipefail

# 1) Create keyrings dir if needed
sudo install -d -m 0755 /etc/apt/keyrings

# 2) Add Cursor's GPG key (dearmored) to a dedicated keyring
curl -fsSL https://downloads.cursor.com/keys/anysphere.asc \
  | gpg --dearmor \
  | sudo tee /etc/apt/keyrings/cursor.gpg > /dev/null

# 3) Add the Cursor apt repository (ties it to that keyring)
echo "deb [arch=amd64,arm64 signed-by=/etc/apt/keyrings/cursor.gpg] https://downloads.cursor.com/aptrepo stable main" \
  | sudo tee /etc/apt/sources.list.d/cursor.list > /dev/null

# 4) Update and install
sudo apt-get update
sudo apt-get install -y cursor
