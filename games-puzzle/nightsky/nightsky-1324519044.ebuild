# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3

inherit eutils games

MY_PN="NightSky"
MY_PN2="NightSkyHD"
DESCRIPTION="A game about rolling a ball through two-dimensional dark, moody environments"
HOMEPAGE="http://www.nicalis.com/nightsky/"

HIBPAGE="http://www.humblebundle.com"
SRC_URI="${MY_PN2,,}-linux-${PV}.tar.gz"

RESTRICT="fetch"
LICENSE="as-is"

SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

RDEPEND="media-libs/freealut
	 media-libs/freeglut
	 media-libs/libogg
	 media-libs/libvorbis
	 media-libs/mesa
	 media-libs/openal
	 sys-libs/zlib
	 virtual/opengl"

S="${WORKDIR}/${MY_PN}"

GAMEDIR="${GAMES_PREFIX_OPT}/${PN}"

pkg_nofetch() {
	einfo ""
	einfo "Please buy and download \"${SRC_URI}\" from:"
	einfo "   ${HIBPAGE}"
	einfo "and move/link it to \"${DISTDIR}\""
	einfo ""
}

src_install() {
	insinto "${GAMEDIR}" || die "insinto \"${GAMEDIR}\" failed"
	# Dirs:
	find . -maxdepth 1 -mindepth 1 -type d ! -iname "lib*" -exec doins -r '{}' \+ || die "doins data failed"
	# Configs:
	doins *.ini || die "doins config failed"

	# Executables:
	exeinto "${GAMEDIR}" || die "exeinto \"${GAMEDIR}\" failed"
	if use amd64
	then
	  newexe "${MY_PN2}_64" "${PN}" || die "newexe \"${MY_PN}\" failed"
	fi
	if use x86
	then
	  newexe "${MY_PN2}" "${PN}" || die "newexe \"${MY_PN}\" failed"
	fi

	# Make game wrapper
	games_make_wrapper "${PN}" "./${PN}" "${GAMEDIR}" || die "games_make_wrapper \"./${PN}\" failed"

	# Install icon and desktop file:
	local icon="${PN}.png"
	newicon "World/The Void/Physical/Circle72.png" "${icon}" || die "newicon \"${icon}\" failed"
	make_desktop_entry "${PN}" "${MY_PN}" "/usr/share/pixmaps/${icon}" || die "make_desktop_entry failed"

	# Setting general permissions:
	prepgamesdirs
}

pkg_postinst() {
	echo ""
	games_pkg_postinst

	# Setting save's permissions:
	chmod -R g+w "${GAMEDIR}/Settings" || die "chmod failed"
}
