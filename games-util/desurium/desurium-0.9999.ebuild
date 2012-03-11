# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3

EGIT_REPO_URI="https://github.com/karolherbst/Desurium"

inherit eutils cmake-utils git-2

DESCRIPTION="Free software version of Desura game client"
HOMEPAGE="https://github.com/karolherbst/Desurium"
LICENSE="GPL-3"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE="builtin-curl builtin-tinyxml +builtin-breakpad +builtin-wxWidgets"

DEPEND=">=sys-devel/gcc-4.5
		dev-vcs/git
		dev-vcs/subversion
		sys-devel/m4
		sys-devel/binutils
		sys-devel/automake
		sys-devel/autoconf
		sys-devel/libtool
		>=x11-libs/gtk+-2.24
		>=dev-libs/nss-3.12
		>=gnome-base/gconf-2.32
		gnome-base/libgnome-keyring
		>=dev-libs/dbus-glib-0.92
		>=dev-util/gperf-3.0.4
		sys-devel/bison
		net-print/libgnomecups
		sys-devel/flex
		virtual/jpeg
		media-libs/alsa-lib
		app-arch/bzip2
		x11-libs/libXpm
		x11-libs/libX11
		dev-libs/openssl
		dev-util/scons
		!builtin-wxWidgets? ( >=x11-libs/wxGTK-2.9.0 )
		dev-libs/boost
		dev-lang/v8
		!builtin-breakpad? ( dev-util/google-breakpad )
		dev-util/gyp
		dev-util/depot_tools
		!builtin-curl? ( net-misc/curl[ares] )
		!builtin-tinyxml? ( dev-libs/tinyxml[-stl] )"
		#check svn co http://google-breakpad.googlecode.com/svn/trunk -r 699  breakpad
		#check svn co http://svn.wxwidgets.org/svn/wx/wxWidgets/tags/WX_2_9_0/ wxWidgets


RDEPEND="${DEPEND}"

S="${WORKDIR}/desurium"

src_configure() {
	mycmakeargs="
        cmake-utils_use_with	builtin-curl      ARES
	"
	cmake-utils_src_configure
}

