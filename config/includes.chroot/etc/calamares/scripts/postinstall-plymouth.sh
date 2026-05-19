#!/bin/sh
set -e

# Set Plymouth theme inside the installed system
plymouth-set-default-theme moobian

# Rebuild initramfs inside installed system
update-initramfs -u
