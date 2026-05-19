#!/bin/bash
set -e
ROOT=$(mount | grep calamares-root | awk '{print $3}')
mount --bind /dev  "$ROOT/dev"
mount --bind /proc "$ROOT/proc"
mount --bind /sys  "$ROOT/sys"
