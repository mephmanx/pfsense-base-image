#!/bin/bash -e

echo "Downloading pfSense Image"
curl -L -o /root/pfSense-CE-memstick-ADI.img.gz https://atxfiles.netgate.com/mirror/downloads/pfSense-CE-memstick-ADI-"$1"-RELEASE-amd64.img.gz
sha256sum /root/pfSense-CE-memstick-ADI.img.gz
