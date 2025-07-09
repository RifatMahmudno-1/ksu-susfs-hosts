#!/bin/sh
SUSFS_BIN="/data/adb/ksu/bin/ksu_susfs"

if [ "$KSU" != true ] ; then
	abort '[!] This module requires KernelSU (Next)'
fi

if [ ! -f "$SUSFS_BIN" ] ; then
    abort '[!] This module requires SuSFS'
fi

mkdir -p "$MODPATH/system/etc"
cat "/system/etc/hosts" > "$MODPATH/system/etc/hosts"
touch "$MODPATH/skip_mount"
