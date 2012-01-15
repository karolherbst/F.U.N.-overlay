# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=2
inherit autotools flag-o-matic eutils games

DESCRIPTION="A kart racing game starring Tux, the linux penguin (TuxKart fork)"
HOMEPAGE="http://supertuxkart.sourceforge.net/"
SRC_URI="mirror://sourceforge/supertuxkart/SuperTuxKart/${PV}/${P}-src.tar.bz2"

LICENSE="GPL-3 CCPL-Attribution-ShareAlike-3.0 CCPL-Attribution-2.0 CCPL-Sampling-Plus-1.0 public-domain as-is"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="debug nls"

RDEPEND=">=dev-games/irrlicht-1.8
	virtual/opengl
	media-libs/freeglut
	virtual/glu
	net-libs/enet:1.3
	media-libs/libvorbis
	media-libs/openal
	nls? ( dev-libs/fribidi )"
DEPEND="${RDEPEND}
	nls? ( sys-devel/gettext )"

src_prepare() {
	find . -name 'Makefile.am' -exec sed \
	-e 's~\$(datadir)/games/\$(PACKAGE)~\$(datadir)/\$(PACKAGE)~' \
	-e 's~\$(datadir)/games/\@PACKAGE\@~\$(datadir)/\@PACKAGE\@~' \
	-i {} \;

	epatch "${FILESDIR}"/"${PN}-0.7.3-build.patch"
	epatch "${FILESDIR}"/"${PN}-0.7.3-underlink.patch"

	rm -rf src/enet

	eautoreconf
}

src_configure() {
	append-libs -lpng -ljpeg -lbz2

	egamesconf \
		--disable-dependency-tracking \
		--disable-optimization \
		$(use_enable debug)
}

src_install() {
	emake DESTDIR="${D}" install || die
	doicon data/${PN}_64.xpm
	make_desktop_entry ${PN} SuperTuxKart ${PN}_64
	dodoc AUTHORS ChangeLog README TODO
	prepgamesdirs
}
