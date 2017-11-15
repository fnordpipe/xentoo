#!/bin/sh

set -e

source /etc/conf.d/luksd

while [ ! -b /dev/mapper/${LUKSD_NAME} ]; do
  sleep 1
done

if [ -f /usr/libexec/luksd/hook.sh ]; then
  /usr/libexec/luksd/hook.sh
fi
