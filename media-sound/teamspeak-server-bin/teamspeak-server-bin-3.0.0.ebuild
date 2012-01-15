# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/media-sound/teamspeak-server-bin/teamspeak-server-bin-3.0.0_rc1.ebuild,v 1.1 2011/06/03 00:40:21 trapni Exp $

EAPI=1

inherit eutils

DESCRIPTION="TeamSpeak Server - Voice Communication Software"
HOMEPAGE="http://teamspeak.com/"
LICENSE="teamspeak3"
SLOT="0"
IUSE=""
KEYWORDS="~amd64 ~x86"
RESTRICT="strip"

SRC_URI="
	amd64? ( http://ftp.4players.de/pub/hosted/ts3/releases/${PV}/teamspeak3-server_linux-amd64-${PV}.tar.gz )
	x86? ( http://ftp.4players.de/pub/hosted/ts3/releases/${PV}/teamspeak3-server_linux-x86-${PV}.tar.gz )
"

DEPEND=""
RDEPEND="${DEPEND}"

pkg_setup() {
	enewuser teamspeak3
}

src_install() {
	local dest="${D}/opt/teamspeak3-server"

	mkdir -p "${dest}"
	cp -R "${WORKDIR}/teamspeak3-server_linux-"*/* "${dest}/" || die

	mv "${dest}/ts3server_linux_"* "${dest}/ts3server-bin" || die
	mv "${dest}/tsdns/tsdnsserver_linux_"* "${dest}/tsdns/tsdnsserver" || die

	# upstream is poked wrt inifile switch for tsdns, we need to keep the inifile in /opt for now.
	mv "${dest}/tsdns/tsdns_settings.ini.sample" "${dest}/tsdns/tsdns_settings.ini" || die

	exeinto /usr/sbin || die
	doexe "${FILESDIR}/ts3server" || die

	# runtime FS layout ...
	insinto /etc/teamspeak3-server
	doins "${FILESDIR}/server.conf"
	newinitd "${FILESDIR}/teamspeak3-server.rc" teamspeak3-server
	newinitd "${FILESDIR}/tsdns-server.rc" tsdns-server

	keepdir /{etc,var/{lib,log,run}}/teamspeak3-server
	fowners teamspeak3 /{etc,var/{lib,log,run}}/teamspeak3-server
	fperms 700 /{etc,var/{lib,log,run}}/teamspeak3-server

	fowners teamspeak3 /opt/teamspeak3-server
	fperms 755 /opt/teamspeak3-server
}
