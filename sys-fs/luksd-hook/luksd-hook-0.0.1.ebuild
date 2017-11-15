# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

DESCRIPTION="daemon to initialize system after luks container is open"
HOMEPAGE="https://www.fnordpipe.org"
SRC_URI=""

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64"
IUSE=""

RDEPEND="
  sys-fs/rluksd
  "

S="${WORKDIR}"

src_install() {
  dodir /usr/libexec/luksd
  dodir /usr/local/system

  exeinto /usr/libexec/luksd
  doexe ${FILESDIR}/hook.sh
}
