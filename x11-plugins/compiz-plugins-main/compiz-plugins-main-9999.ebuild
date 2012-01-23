# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EGIT_HAS_SUBMODULES=true
EAPI="2"

inherit cmake-utils eutils git

DESCRIPTION="Compiz Window Manager Plugins"
HOMEPAGE="http://www.compiz.org/"
EGIT_REPO_URI="git://anongit.compiz.org/compiz/plugins-main"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS=""
IUSE=""

RDEPEND="
	!x11-plugins/compiz-fusion-plugins-main
	>=gnome-base/librsvg-2.14.0
	virtual/jpeg
	x11-libs/cairo
	~x11-wm/compiz-${PV}
"

DEPEND="${RDEPEND}
	>=dev-util/intltool-0.35
	>=dev-util/pkgconfig-0.19
	>=sys-devel/gettext-0.15
"

src_configure() {
	cmake-utils_src_configure
}

src_compile() {
	cmake-utils_src_compile
}

src_install() {
	cmake-utils_src_install
}
