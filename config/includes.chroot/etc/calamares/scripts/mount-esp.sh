#!/bin/bash
set -e
ROOT=$(mount | grep calamares-root | awk '{print $3}')
ESP=$(blkid -t PARTLABEL="EFI system" -o device || blkid -t PARTLABEL="EFI" -o device || true)
mkdir -p "$ROOT/boot/efi"
[ -n "$ESP" ] && mount "$ESP" "$ROOT/boot/efi" || true
