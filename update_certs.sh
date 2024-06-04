#!/bin/bash
set -e
echo "Attempt to update certificate for Microsoft Edge"
set -x
/bin/rm -f microsoft.asc
wget https://packages.microsoft.com/keys/microsoft.asc
set +x
echo "Attempt to update certificate for Google Chrome"
set -x
/bin/rm -f linux_signing_key.pub
wget https://dl-ssl.google.com/linux/linux_signing_key.pub
set +x
echo "Attempt to update certificate for Beyond Compare"
set -x
/bin/rm -f RPM-GPG-KEY-scootersoftware
wget https://www.scootersoftware.com/RPM-GPG-KEY-scootersoftware
set +x
echo "Attempt to update certificate for Dropbox"
set -x
/bin/rm -f rpm-public-key.asc
wget https://linux.dropbox.com/fedora/rpm-public-key.asc
set +x
echo "Attempt to update keyring for Debian librewolf"
set -x
/bin/rm -f librewolf.gpg
wget -O- https://deb.librewolf.net/keyring.gpg | sudo gpg --dearmor -o ./librewolf.gpg
set +x
exit 0
