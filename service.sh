#!/bin/sh
MODDIR="${0%/*}"
SUSFS_BIN="/data/adb/ksu/bin/ksu_susfs"
target_hostsfile="$MODDIR/system/etc/hosts"
system_hostfile="/system/etc/hosts"

# Bind mount the custom hosts file
mount --bind "$target_hostsfile" "$system_hostfile"

# Register with KernelSU SUSFS for persistent remount
"$SUSFS_BIN" add_try_umount "$system_hostfile" 1
