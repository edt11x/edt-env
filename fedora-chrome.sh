#!/bin/bash
set -e
set -x
sudo dnf install google-linux-signing-key -y
sudo dnf config-manager --add-repo https://dl.google.com/linux/chrome/rpm/stable/x86_64/google-chrome.repo
sudo dnf install google-chrome-stable -y
