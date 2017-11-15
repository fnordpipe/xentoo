# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit user

DESCRIPTION="daemon to unlock luks container remotely"
HOMEPAGE="https://www.fnordpipe.org"
SRC_URI="https://github.com/esno/rluksd/archive/v${PV}.tar.gz -> ${PN}-${PV}.tar.gz"

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

S="${WORKDIR}/rluksd-${PV}"

src_install() {
  dodir /sbin
  dodir /usr/libexec/luksd

  exeinto /sbin
  doexe ${S}/luksd
  newexe ${S}/locky rluksd
  newexe ${FILESDIR}/luksd-hook.sh luksd-hook

  newinitd ${FILESDIR}/rluksd.init rluksd
  newinitd ${FILESDIR}/luksd.init luksd

  newconfd ${FILESDIR}/rluksd.conf rluksd
  newconfd ${FILESDIR}/luksd.conf luksd

  newinitd ${FILESDIR}/luksd-hook.init luksd-hook
}

pkg_preinst() {
  enewgroup rluksd 837
  enewuser rluksd 837 -1 /var/empty rluksd
}
