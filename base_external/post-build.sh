#!/bin/sh

set -u
set -e

# Add a console on tty1
if [ -e ${TARGET_DIR}/etc/inittab ]; then
    grep -qE '^tty1::' ${TARGET_DIR}/etc/inittab || \
	sed -i '/GENERIC_SERIAL/a\
tty1::respawn:/sbin/getty -L  tty1 0 vt100 # HDMI console' ${TARGET_DIR}/etc/inittab
fi

# By ChatGPT
TARGET_OVERLAYS="$TARGET_DIR/boot/overlays"
mkdir -p $TARGET_OVERLAYS

# Compile DTS → DTBO automatically
dtc -@ -I dts -O dtb \
    ../base_external/dts/ds1722-overlay.dts \
    -o $TARGET_OVERLAYS/ds1722.dtbo

# Ensure config.txt loads the overlay
CONFIG_TXT="$TARGET_DIR/boot/config.txt"

# Only append once
grep -q "^dtoverlay=ds1722" "$CONFIG_TXT" || echo "dtoverlay=ds1722" >> "$CONFIG_TXT"