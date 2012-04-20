# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3

inherit check-reqs cmake-utils eutils git-2 games

EGIT_REPO_URI="git://github.com/lodle/Desurium.git"
DESCRIPTION="Free software version of Desura game client"
HOMEPAGE="https://github.com/lodle/Desurium"
LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="builtin-curl builtin-tinyxml debug"

DEPEND="
	app-arch/bzip2
	dev-db/sqlite
	dev-libs/boost
	dev-libs/openssl
	!builtin-tinyxml? (
		|| ( <dev-libs/tinyxml-2.6.2-r2[-stl]
		     >=dev-libs/tinyxml-2.6.2-r2
		)
	)
	dev-lang/v8
	dev-vcs/subversion
	!builtin-curl? (
		net-misc/curl
	)
	builtin-curl? (
		net-dns/c-ares
	)
	>=sys-devel/gcc-4.5
	>=x11-libs/gtk+-2.24
	gnome-base/libgnome-keyring
	x11-libs/libnotify"
#	!builtin-wxWidgets? ( >=x11-libs/wxGTK-2.9.0 )
#	net-print/libgnomecups
#	dev-util/gyp
#	dev-util/depot_tools
#	check svn co http://google-breakpad.googlecode.com/svn/trunk -r 699  breakpad
#	check svn co http://svn.wxwidgets.org/svn/wx/wxWidgets/tags/WX_2_9_0/ wxWidgets


RDEPEND="${DEPEND}"

S="${WORKDIR}/desura"

pkg_pretend() {
	CHECKREQS_DISK_BUILD="4G"
	check-reqs_pkg_pretend
}

src_configure() {
	mycmakeargs=(
		$(cmake-utils_use_with builtin-curl ARES)
		$(cmake-utils_use debug DEBUG)
		-DBUILD_CEF=TRUE
		-DCMAKE_INSTALL_PREFIX=${GAMES_PREFIX}/${PN}
	)
	cmake-utils_src_configure
}

src_compile() {
	cmake-utils_src_compile
}

src_install() {
	cmake-utils_src_install

	dogamesbin ${FILESDIR}/launch-desura.sh
	doicon ${FILESDIR}/desura.png
	make_desktop_entry "launch-desura.sh" "Desurium" "desura"

	prepgamesdirs
}
