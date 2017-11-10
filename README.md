![gentoo](https://gentoo.org/assets/img/badges/gentoo-badge2.png "gentoo")

# setup

### setup the toolchain:

    $ git clone https://github.com/fnordpipe/xentoo.git
    $ bash ./env.sh <container>

### update the toolchain:

    $ bash ./env.sh <container>

### run the build:

    $ lxc-attach -n <container> -- /bin/su -l
    $ bake -aveq dom0-image

The rootfs is located at `/var/lib/xentoo/rootfs`
