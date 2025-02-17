#!/bin/bash

if [ $# -lt 1 ]; then
    echo "$0 <hda_file>"
    exit
fi

qemu-system-x86_64 \
    -cpu host \
    -smp 8 \
    -m 8G \
    -drive file=base.qcow2,format=qcow2,if=virtio \
    -net nic \
    -net user,hostfwd=tcp::8888-:22 \
    -enable-kvm \
    -nographic
