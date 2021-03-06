#!/bin/sh
set -ex

. ./common-functions.sh

c_nameserver 8.8.8.8

echo "UUID=deadbeef-dead-beef-dead-beefdeadbeef /                       ext4     defaults        0 0" > /etc/fstab

i_base_fedora

i_kernel_khadas_vim_31429

c_fw_utils "/dev/mmcblk0 0x7400000 0x10000"

passwd root
adduser -c '' fedora
usermod -aG adm,cdrom,wheel,dialout fedora
passwd fedora
