#!/bin/bash
# Apply patches to the initramfs
set -euo pipefail

in=$1
out=$2

if [ "$in" = "" ] || [ "$out" = "" ]; then exit 1; fi

files="$(dirname "$(realpath "$0")")"

tmp=$(mktemp -d)
trap 'rm -rf "$tmp"' EXIT

# strip uImage hdr, decompress, and unpack
mkdir "$tmp/fs"
( cd "$tmp/fs" && dd if="$(realpath "$in")" bs=64 skip=1 status=none | gzip -d | cpio -idm --quiet )

# Apply our patches
for patch in "$files"/initramfs-*.patch; do
	patch -d "$tmp/fs" -Np1 -i "$patch" || {
		echo "initramfs-patch: failed on patch $(basename "$patch")"
		exit 1
	}
done

# repack, recompress
( cd "$tmp/fs" && find . -mindepth 1 -printf '%P\n' | LC_ALL=C sort | cpio -o -H newc --reproducible --quiet | gzip -9n > "$tmp/cpio.new.gz" )
# turn back into uImage
mkimage -A arm64 -O linux -T ramdisk -C gzip -n initramfs -d "$tmp/cpio.new.gz" "$out" >/dev/null
