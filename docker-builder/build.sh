#!/usr/bin/bash
docker build --rm -t kth5/archpower-builder:$(date "+%Y%m%d") -t kth5/archpower-builder:latest .
