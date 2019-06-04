#!/usr/bin/bash
set -e

PKG_REMOVE=(
dhcpcd
jfsutils
linux-firmware
linux
man-pages
systemd-resolvconf
xfsprogs
)


rm -rf $(pwd)/sysroot
mkdir -p $(pwd)/sysroot/var/lib/pacman
pacman --noconfirm -r $(pwd)/sysroot -Sy base 
pacman --noconfirm -r $(pwd)/sysroot -Rcs ${PKG_REMOVE[@]}
docker build --no-cache --rm -t kth5/archpower:$(date "+%Y%m%d") -t kth5/archpower:latest .
