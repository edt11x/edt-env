#!/usr/bin/env bash
set -euo pipefail
set -x

echo "Attempt to update certificate for Microsoft Edge"
/bin/rm -f microsoft.asc
wget -q https://packages.microsoft.com/keys/microsoft.asc

echo "Attempt to update certificate for Google Chrome"
/bin/rm -f linux_signing_key.pub
wget -q https://dl-ssl.google.com/linux/linux_signing_key.pub

echo "Attempt to update certificate for Beyond Compare"
/bin/rm -f RPM-GPG-KEY-scootersoftware
wget -q https://www.scootersoftware.com/RPM-GPG-KEY-scootersoftware

echo "Attempt to update certificate for Dropbox"
/bin/rm -f rpm-public-key.asc
wget -q https://linux.dropbox.com/fedora/rpm-public-key.asc

echo "Attempt to update keyring for Debian librewolf"
/bin/rm -f librewolf.gpg
wget -qO- https://deb.librewolf.net/keyring.gpg | sudo gpg --dearmor -o ./librewolf.gpg

exit 0
