#!/bin/bash

echo "$#"

if [ $# -lt 2 ]; then
    echo "$0 <iso_file> <hda_file>"
    exit
fi

qemu-system-x86_64 \
    -L ../femu/pc-bios \
    -cdrom $1 \
    -hda $2 \
    -boot d \
    -cpu host \
    -smp 8 \
    -m 8G \
    -net nic \
    -net user \
    -enable-kvm \
    -nographic \
