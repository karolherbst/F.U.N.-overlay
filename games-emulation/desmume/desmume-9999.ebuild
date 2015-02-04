# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="3"

inherit eutils games subversion autotools

DESCRIPTION="Nintendo DS emulator"
HOMEPAGE="http://desmume.org/"
SRC_URI=""
ESVN_REPO_URI="https://desmume.svn.sourceforge.net/svnroot/desmume/trunk/desmume"
ESVN_PROJECT="desmume"
LICENSE="GPL-2"
SLOT="0"
KEYWORDS=""
IUSE="openal gtk glade osmesa nls wifi"

RDEPEND="virtual/opengl
	sys-libs/zlib
	dev-libs/zziplib
	media-libs/libsdl[joystick]
	x11-libs/agg
	nls? (
		virtual/libintl
		sys-devel/gettext
	)
	openal? ( media-libs/openal )
	gtk? (
		>=x11-libs/gtk+-2.8.0
		x11-libs/gtkglext
	)
	glade? (
		gnome-base/libglade
		x11-libs/gtkglext
	)
	osmesa? ( media-libs/mesa[osmesa] )
	wifi? ( net-libs/libpcap )
"
DEPEND="${RDEPEND}
	|| (
		dev-vcs/subversion[webdav-neon]
		dev-vcs/subversion[http]
	)
"

src_prepare() {
	use wifi && \
		eerror "wifi support is broken and may not work"

	if ! use gtk && $(use glade); then
		einfo "glade support was requested but not gtk"
		einfo "glade(libglade) depends on gtk"
		einfo "it may be usefull to enable gtk support after all"
	fi

	eautoreconf
}

src_configure() {
	egamesconf --datadir=/usr/share \
		$(use_enable openal) \
		$(use_enable osmesa) \
		$(use_enable nls) \
		$(use_enable wifi) \
		|| die "egamesconf failed"
}

src_install() {
	emake DESTDIR="${D}" install || die "emake failed"
	if ! use gtk; then
		[ -f "${D}/${GAMES_BINDIR}/desmume" ] && rm "${D}/${GAMES_BINDIR}/desmume"
	fi
	if ! use glade; then
		[ -f "${D}/${GAMES_BINDIR}/desmume-glade" ] && rm "${D}/${GAMES_BINDIR}/desmume-glade"
	fi
	dodoc AUTHORS ChangeLog README README.LIN
	prepgamesdirs
}
