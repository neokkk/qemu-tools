#!/bin/bash

if [ $# -lt 1 ]; then
    echo "$0 <qcow2_file>"
    exit
fi

nohup qemu-system-x86_64 \
    -cpu host \
    -smp 8 \
    -m 8G \
    -drive file=$1,format=qcow2,if=virtio \
    -device nvme-subsys,id=nvme-subsys0,fdp=on,fdp.runs=96M,fdp.nrg=1,fdp.nruh=16 \
    -device nvme,id=nvme0,serial=deadbeef,subsys=nvme-subsys0 \
    -drive id=fdp-1,file=fdp-1.img,format=raw,if=none \
    -device nvme-ns,id=fdp-1,drive=fdp-1,nsid=1 \
    -drive id=fdp-2,file=fdp-2.img,format=raw,if=none \
    -device nvme-ns,id=fdp-2,drive=fdp-2,nsid=2,fdp.ruhs=1-15 \
    -net nic \
    -net user,hostfwd=tcp::8889-:22 \
    -enable-kvm \
    -nographic &
