#!/bin/bash -ex

# Cleanup
rm -rf archlive

# Prepare rootfs
cp -r /usr/share/archiso/configs/releng archlive
cat autologin.conf > archlive/airootfs/etc/systemd/system/getty@tty1.service.d/autologin.conf
sed -i 's/Boot Arch Linux (x86_64)/Wipe drive and Install Arch/g' archlive/syslinux/archiso_sys.cfg
cp install.sh archlive/airootfs/root/install.sh
chmod 755 archlive/airootfs/root/install.sh

# Build the iso
cd archlive
./build.sh -v

