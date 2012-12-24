# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header:  $

EAPI=4
inherit eutils games versionator

MY_ARCH="${ARCH/x86/i386}"
MY_PN="bit.trip.runner"
MY_PVP="$(get_version_component_range 3)"
MY_PV="$(get_version_component_range 1-2)-${MY_PVP/p/}"
MY_REV="1348702546"

DESCRIPTION="an arcade-style rhythm game developed by Gaijin Games"
HOMEPAGE="http://www.bittripgame.com/"
SRC_URI="${MY_PN}_${MY_PV}_${MY_ARCH}-${MY_REV}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="amd64 ~x86"
IUSE=""
RESTRICT="fetch strip"

RDEPEND="media-libs/libogg
	media-libs/libsdl
	media-libs/libvorbis
	media-libs/openal
	sys-libs/zlib
	virtual/glu
	virtual/opengl
	x11-libs/libxcb
	x11-libs/libXext"
DEPEND=""

S=${WORKDIR}/${MY_PN}-$(get_version_component_range 1-2)

GAMEDIR=${GAMES_PREFIX_OPT}/${PN}

pkg_nofetch() {
	echo
	elog "Please purchase and download '${SRC_URI}'"
	elog "then copy to: '${DISTDIR}'"
	echo
}

src_install() {
	insinto "${GAMEDIR}"
	exeinto "${GAMEDIR}"

	# Install and remove icon
	newicon ${MY_PN}/RUNNER.png ${PN}.png && rm ${MY_PN}/RUNNER.png \
		|| die "install icon"

	# Install game files
	doins -r ${MY_PN}/* || die "install data"
	doexe ${MY_PN}/${MY_PN} || die "install exe"

	# install documentation
	dodoc README || die "install doc"
	dohtml README.html || die "install html doc"

	# install shortcuts
	games_make_wrapper ${PN} ./${MY_PN} "${GAMEDIR}" "${LIBDIR}" \
		|| die "install shortcuts"
	make_desktop_entry ${PN} "Bit.Trip Runner"
	prepgamesdirs
}

pkg_postinst() {
	einfo "To play the game, run:"
	einfo "${PN}"
	games_pkg_postinst
}
