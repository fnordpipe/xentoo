# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

DESCRIPTION="daemon to unlock luks container remotely"
HOMEPAGE="https://www.fnordpipe.org"
SRC_URI="https://github.com/esno/locky/archive/v${PV}.tar.gz -> ${PN}-${PV}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64"
IUSE=""

DEPEND="
  dev-libs/openssl
  sys-fs/cryptsetup
  "

RDEPEND="
  ${DEPEND}
  "

S="${WORKDIR}/locky-${PV}"

src_install() {
  dodir /sbin

  exeinto /sbin
  newexe ${S}/locky rluksd
  doexe ${S}/luksd
}
