#!/usr/bin/bash
set -e

rm -rf $(pwd)/sysroot
mkdir -p $(pwd)/sysroot/etc/pacman.d
mkdir -p $(pwd)/sysroot/var/lib/pacman
touch $(pwd)/sysroot/etc/pacman.d/mirrorlist
pacstrap -cM -C /etc/pacman.conf $(pwd)/sysroot base
docker build --no-cache --rm -t kth5/archpower:$(date "+%Y%m%d") -t kth5/archpower:latest .
