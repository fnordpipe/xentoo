# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

DESCRIPTION="meta package for xen dom0 rootfs"
HOMEPAGE="https://www.fnordpipe.org"
SRC_URI=""

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64"
IUSE=""

RDEPEND="
  app-emulation/xen
  net-misc/bridge-utils
  sys-boot/syslinux
  sys-fs/mdadm
  sys-fs/rluksd
  sys-kernel/linux-stable
  "
