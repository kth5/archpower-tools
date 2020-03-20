#!/usr/bin/bash
set -e

rm -rf $(pwd)/sysroot
mkdir -p $(pwd)/sysroot/var/lib/pacman
pacman --noconfirm -r $(pwd)/sysroot -Sy pacman archlinux-keyring sed gzip
docker build --no-cache --rm -t kth5/archpower:$(date "+%Y%m%d") -t kth5/archpower:latest .
