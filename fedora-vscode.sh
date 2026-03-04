#!/bin/bash

# Define variables
REPO_FILE="/etc/yum.repos.d/vscode.repo"
GPG_KEY_URL="https://packages.microsoft.com/keys/microsoft.asc"

echo "Checking for VS Code installation..."

# 1. Check if the GPG key is already imported to avoid duplicates
if ! rpm -q gpg-pubkey --qf '%{SUMMARY}\n' | grep -qi "Microsoft (Release signing)"; then
    echo "Importing Microsoft GPG key..."
    sudo rpm --import "$GPG_KEY_URL"
else
    echo "Microsoft GPG key already exists. Skipping."
fi

# 2. Check if the repo file already exists
if [ ! -f "$REPO_FILE" ]; then
    echo "Adding Visual Studio Code repository..."
    sudo sh -c "cat <<EOF > $REPO_FILE
[code]
name=Visual Studio Code
baseurl=https://packages.microsoft.com/yumrepos/vscode
enabled=1
gpgcheck=1
gpgkey=$GPG_KEY_URL
EOF"
else
    echo "Repository file already exists at $REPO_FILE. Skipping."
fi

# 3. Install VS Code using DNF5
echo "Updating metadata and installing VS Code..."
sudo dnf install -y code

echo "Installation complete! You can start it by typing 'code' in your terminal."
