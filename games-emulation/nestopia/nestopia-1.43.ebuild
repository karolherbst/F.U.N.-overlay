# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

inherit eutils games

DESCRIPTION="Nestopia Undead: A cycle-accurate NES/Famicom and FDS emulator"
HOMEPAGE="http://0ldsk00l.ca/nestopia.html"
SRC_URI="https://github.com/downloads/rdanbrook/${PN}/${P}.tgz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86"
IUSE=""

DEPEND="media-libs/alsa-lib
	media-libs/libsdl
	virtual/glu
	x11-libs/gtk+:3"
RDEPEND="${DEPEND}"

src_prepare() {
	epatch "${FILESDIR}/${P}-makefile.patch"
	sed -i Makefile \
		-e "s:%GAMES_PREFIX%:${GAMES_PREFIX}:g" \
		-e "s:%GAMES_DATADIR%:${GAMES_DATADIR}:g" \
		-e "s:%GAMES_BINDIR%:${GAMES_BINDIR}:g" \
		|| die "sed failed"
}

