#!/bin/sh
mkdir -p "$MODPATH/system/etc"
cat "/system/etc/hosts" > "$MODPATH/system/etc/hosts"
touch "$MODPATH/skip_mount"
