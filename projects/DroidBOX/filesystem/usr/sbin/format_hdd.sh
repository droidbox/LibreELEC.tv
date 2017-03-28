#!/bin/sh

umount /dev/sda*
sleep 1
dd if=/usr/sbin/16.img of=/dev/sda bs=1M
sleep 5
PART=$(grep "/var/media/HDD " /proc/mounts | cut -d" " -f1 | grep '1$')
DISK=$(echo $PART | sed s/1$//g)
PART_START=$(parted -s -m $DISK unit b print |grep -v ^/dev |grep -v BYT | grep ^1: |  cut -f2 -d ":")
umount $PART
parted -s -m $DISK rm 1
parted -s -m $DISK unit b mkpart primary $PART_START 100%
sleep 5
umount $PART
e2fsck -f -p $PART
resize2fs $PART
mount $PART /var/media/HDD
kodi-send --action="Notification(Format HDD,Format HDD successfully)"
