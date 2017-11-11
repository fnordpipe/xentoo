![gentoo](https://gentoo.org/assets/img/badges/gentoo-badge2.png "gentoo")

# about

xentoo is a gentoo-based linux-distro that aims to be a lean xen dom0 firmware.
it's designed to be a single initram that boots a full encrypted filesystem using
[rluksd](https://github.com/esno/locky).

# setup

## setup the toolchain

    $ git clone https://github.com/fnordpipe/xentoo.git
    $ bash ./env.sh <container>

## update the toolchain

    $ bash ./env.sh <container>

## run the build

    $ lxc-attach -n <container> -- /bin/su -l
    $ bake -aveq dom0-image

The rootfs is located at `/var/lib/xentoo/rootfs`

# documentation

* [gentoo devmanual](https://devmanual.gentoo.org)
  * [ebuild writing](https://devmanual.gentoo.org/ebuild-writing/index.html)
* `man 5 ebuild`
