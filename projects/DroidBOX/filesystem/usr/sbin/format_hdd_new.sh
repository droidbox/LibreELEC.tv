MEDIA=$(grep -Hv ^0$ /sys/block/*/removable |
    sed s/removable:.*$/device\\/uevent/ |
    xargs grep -H ^DRIVER=sd |
    sed s/device.uevent.*$/size/ |
    xargs grep -Hv ^0$ |
    cut -d / -f 4)
umount /dev/$MEDIA*
dd if=/dev/zero of=/dev/${MEDIA} bs=1M count=1
parted /dev/${MEDIA} mklabel msdos
#mount | grep sda #umount /dev/$MEDIA*
parted /dev/${MEDIA} mkpart primary ext2 0% 100%
#mount | grep sda
umount /dev/$MEDIA*
echo yes | mkfs.ext4 -v -m0 -O ^has_journal -L HDD /dev/${MEDIA}1
mount -t ext4 /dev/sda1 /var/media/HDD
kodi-send --action="Notification(Format HDD,Format HDD successfully)"
