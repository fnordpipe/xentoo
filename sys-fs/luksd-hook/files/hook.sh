#!/bin/sh

set -e

vgchange -ay ${VG_NAME}
mount /dev/mapper/${VG_NAME}-${LV_NAME} /usr/local/system
/etc/init.d/net.sysinit0 stop

umount /etc/conf.d/net

mount -o bind \
  /usr/local/system/root /root

mount -t aufs \
  none /etc \
  -o br=/usr/local/system/etc:/etc

for iface in ${NETWORK_INTERFACES}; do
  ln -snf net.lo /etc/init.d/net.${iface}
  /etc/init.d/net.${iface} start
done

/etc/init.d/sshd start
/etc/init.d/xendomains start
