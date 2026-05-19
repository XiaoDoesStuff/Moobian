#!/bin/bash
set -e

echo "[Moobian] Full live-build purge starting..."

# 1. Unmount anything live-build left behind
echo "[Moobian] Unmounting leftover mounts..."
sudo umount -lf chroot/proc 2>/dev/null || true
sudo umount -lf chroot/sys 2>/dev/null || true
sudo umount -lf chroot/dev/pts 2>/dev/null || true
sudo umount -lf chroot/dev 2>/dev/null || true

# 2. Live-build purge (bootstrap + chroot + binary)
echo "[Moobian] Running lb clean --purge..."
sudo lb clean --purge || true

# 3. Remove all generated directories
echo "[Moobian] Removing generated directories..."
sudo rm -rf \
    chroot \
    binary \
    cache \
    tmp \
    .stage \
    .build \
    live-image-* \
    filesystem.packages \
    filesystem.squashfs \
    config/binary \
    config/bootstrap \
    config/common \
    config/source \
    config/chroot \

# 4. Recreate required empty directories so GitHub Actions doesn't choke
echo "[Moobian] Recreating required directories..."
mkdir -p config/includes.chroot
mkdir -p config/includes.binary
mkdir -p config/archives
mkdir -p config/hooks/normal
mkdir -p config/package-lists

echo "[Moobian] Deep clean complete."

