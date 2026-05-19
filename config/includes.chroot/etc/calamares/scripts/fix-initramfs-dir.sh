#!/bin/bash
set -e
ROOT=$(mount | grep calamares-root | awk '{print $3}')
mkdir -p "$ROOT/etc/initramfs-tools/conf.d"
