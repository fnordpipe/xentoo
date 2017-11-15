# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit user

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

  newinitd ${FILESDIR}/rluksd.init rluksd
  newinitd ${FILESDIR}/luksd.init luksd

  newconfd ${FILESDIR}/rluksd.conf rluksd
  newconfd ${FILESDIR}/luksd.conf luksd
}

pkg_preinst() {
  enewgroup rluksd 837
  enewuser rluksd 837 -1 /var/empty rluksd
}
