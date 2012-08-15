# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3

inherit eutils

DESCRIPTION="the All-In-One Solution for Remote Access and Support over the Internet"
HOMEPAGE="http://www.teamviewer.com"
SRC_URI="http://www.teamviewer.com/download/version_7x/teamviewer_linux.tar.gz -> ${P}.tar.gz"

LICENSE="TeamViewer"
SLOT="0"
KEYWORDS="~amd64 x86"
IUSE=""

RESTRICT="mirror strip"

DEPEND="app-emulation/wine"
RDEPEND="${DEPEND}"

pkg_setup() {
	elog "This ebuild installs the TeamViewer binary and libraries and relies on"
	elog "Gentoo's wine package to run the actual program."
	elog
	elog "If you encounter any problems, consider running TeamViewer with the"
	elog "bundled wine package manually."
}

src_install() {
	insinto /opt/teamviewer/ || die
	doins teamviewer7/.wine/drive_c/Program\ Files/TeamViewer/Version7/* ||
		die
	echo "#!/bin/bash" > teamviewer || die
	echo "/usr/bin/wine /opt/teamviewer/TeamViewer.exe" >> teamviewer || die
	insinto /usr/bin || die
	dobin teamviewer || die

	local res
	for res in 48; do
		insinto /usr/share/icons/hicolor/${res}x${res}/apps
		doins teamviewer7/.tvscript/teamviewer.png || die
	done

	dodoc teamviewer7/linux_FAQ_{EN,DE}.txt || die

	make_desktop_entry ${PN} TeamViewer ${PN}
}
