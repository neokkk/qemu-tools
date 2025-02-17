#!/bin/bash

genisoimage -o custom-ubuntu.iso \
    -r -no-emul-boot \
    -boot-load-size 4 -boot-info-table \
    -b boot/grub/i386-pc/eltorito.img \
    -c boot.catalog \
    -eltorito-alt-boot \
    -e EFI/boot/bootx64.efi \
    -no-emul-boot \
    ./custom-iso
