# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4
inherit check-reqs games

MY_PN="DungeonDefenders"

DESCRIPTION="Combines the genres of tower defense and action RPG"
HOMEPAGE="http://dungeondefenders.com"
SRC_URI="dundef-linux-${PV:4:2}${PV:6:2}${PV:0:4}.tar.bz2
	http://www.humblebundle.com/static/hashed/60f589016fa945cac52b5a07c10113a2e2a07a83.png -> ${PN}.png"
LICENSE=""
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""
RESTRICT="mirror"

DEPEND=""
RDEPEND="x11-misc/xdg-utils
	virtual/opengl
	amd64? (
		app-emulation/emul-linux-x86-sdl
		app-emulation/emul-linux-x86-xlibs )
	x86? ( >=media-libs/openal-1 )"

S="${WORKDIR}/${MY_PN}"
DDDATA="${GAMES_PREFIX_OPT}/${PN}"
QA_PREBUILT="${DDDATA#/}/UDKGame/Binaries/${MY_PN}-x86"

CHECKREQS_DISK_BUILD="5750M"
CHECKREQS_DISK_USR="5750M"

src_prepare() {
	# https://bugzilla.icculus.org/show_bug.cgi?id=5820
	sed -i "s:/usr/bin/gnome-screensaver-command:/bin/true\x0                        :g" \
		UDKGame/Binaries/libSDL2-2.0.so.0 || die
}

src_install() {
	# Remove the binaries that we're unbundling.
	rm -v UDKGame/Binaries/{libopenal.so.1,xdg-open} || die

	# Move the data rather than copying. The game consumes over 5GB so
	# a needless copy should really be avoided!
	dodir "${DDDATA}"
	mv -v Engine UDKGame "${D}${DDDATA}" || die

	# We would install the binary to GAMES_BINDIR but it looks for the
	# game content in ../.. relative to its real location.
	dosym "${DDDATA}/UDKGame/Binaries/${MY_PN}-x86" "${GAMES_BINDIR}/${PN}"

	doicon "${DISTDIR}/${PN}.png"
	make_desktop_entry "${PN}" "Dungeon Defenders"

	prepgamesdirs
}
