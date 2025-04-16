#!/bin/bash
# Optionally run the original post-image script first:
bash board/qemu/post-image.sh "$@"

# Then create the symlink:
ln -sf "${BINARIES_DIR}/rootfs.ext2" "${BINARIES_DIR}/rootfs.ext4"
