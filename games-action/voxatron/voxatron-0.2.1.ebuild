# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3

inherit eutils games

MY_PN="${PN:0:3}"
UP_PN="${PN^*}"

DESCRIPTION="A game set in a world completely made of tiny cubes that can be blasted to smithereens"
HOMEPAGE="http://www.lexaloffle.com/${PN}.php"
SRC_URI="${PN}_${PV}_i386.tar.gz"

RESTRICT="fetch"
LICENSE="${PN}"

SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

RDEPEND="amd64? ( app-emulation/emul-linux-x86-sdl
		  app-emulation/emul-linux-x86-opengl )
	 x86? ( media-libs/libsdl[audio,joystick,video]
		virtual/opengl )"

GAMEDIR="${GAMES_PREFIX_OPT}/${PN}"
S="${WORKDIR}/${PN}"

pkg_nofetch() {
	einfo ""
	einfo "Please buy and download '${SRC_URI}'"
	einfo "and move to/link from: '${DISTDIR}'"
	einfo ""
}

src_install() {
	# Install data
	insinto "${GAMEDIR}"
	doins "${MY_PN}.dat" || die "doins failed"

	# Install docs
	dodoc "${PN}.txt" || die "dodoc failed"

	# Install executable
	exeinto "${GAMEDIR}"
	doexe "${MY_PN}" || die "doexe failed"

	# Make game wrapper
	games_make_wrapper "${PN}" "./${MY_PN}" "${GAMEDIR}" || die "games_make_wrapper failed"

	# Install icon and desktop file
	newicon lexaloffle-vox.png "${PN}.png" || die "newicon failed"
	make_desktop_entry "${PN}" "${UP_PN}" || die "make_desktop_entry failed"

	# Setting permissions
	prepgamesdirs
}

pkg_postinst() {
	echo ""
	games_pkg_postinst

	einfo "${UP_PN} savegames and configurations are stored in:"
	einfo "   \${HOME}/.lexaloffle/${UP_PN}"
	echo ""
}
