#!/bin/sh
MODDIR="${0%/*}"
SUSFS_BIN="/data/adb/ksu/bin/ksu_susfs"
target_hostsfile="$MODDIR/system/etc/hosts"
system_hostfile="/system/etc/hosts"

update_description() {
	sed -i "s|^description=.*|description=$(printf '%s' "$1")|" "$MODDIR/module.prop"
}

if [ "$KSU" != true ] ; then
    update_description 'KernelSU (Next) is required ❌'
    exit 1
elif [ ! -f "$SUSFS_BIN" ] ; then
    update_description 'SuSFS is required ❌'
    exit 1
else
    mount --bind "$target_hostsfile" "$system_hostfile"
    "$SUSFS_BIN" add_try_umount "$system_hostfile" 1
fi

if [ -w "$system_hostfile" ]; then
    update_description 'Module is working ✅'
else
    update_description 'Module not working ❌'
fi
