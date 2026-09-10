#!/bin/bash
set -e
set -x
USE_OLD_METHOD=0
if [ $USE_OLD_METHOD = 1 ]
then
    sudo dnf install -y fedora-workstation-repositories
    sudo dnf config-manager setopt google-chrome.enabled=1
    sudo dnf install google-chrome-stable -y
else
    # See what Google keys are already in the RPM db
    rpm -q gpg-pubkey --qf '%{NAME}-%{VERSION}-%{RELEASE}  %{SUMMARY}\n' | grep -i google

    # Remove both old Google keys (ignore "not installed" if one is missing)
    sudo rpm -e gpg-pubkey-7fac5991-* gpg-pubkey-d38b4796-* 2>/dev/null || true

    # Import the current key bundle from Google
    curl -fsSL -O https://dl.google.com/linux/linux_signing_key.pub
    sudo rpm --import linux_signing_key.pub
    rm -f linux_signing_key.pub

    # Clear stale metadata and retry
    sudo dnf clean all
    sudo dnf install google-chrome-stable
fi

