# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=2

EGIT_REPO_URI="https://github.com/lodle/Desurium"

inherit eutils subversion git-2

DESCRIPTION="Free software version of Desura game client"
HOMEPAGE="http://subspacebattle.sf.net"
LICENSE="GPL-3"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

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
		x11-libs/wxGTK
		dev-libs/boost"
		#Add dependencies for:
		#wxWidgets
		#boost
		#breakpad?
		#gyp?
		#svn co http://src.chromium.org/svn/trunk/tools/depot_tools depot_tools
		#svn co http://gyp.googlecode.com/svn/trunk gyp
		#svn co http://google-breakpad.googlecode.com/svn/trunk -r 699  breakpad
		#svn co http://svn.boost.org/svn/boost/tags/release/Boost_1_47_0 boost
		#svn co http://v8.googlecode.com/svn/tags/3.7.7/ v8
		#svn co http://svn.wxwidgets.org/svn/wx/wxWidgets/tags/WX_2_9_0/ wxWidgets
		#git clone git://github.com/bagder/c-ares.git c-ares

RDEPEND="${DEPEND}"

S="${WORKDIR}/desurium"

src_configure() {
	cp -r src/branding_default src/branding
	cd src/third_party
	./SvnCheckOut.sh
	#cmake . || die
}

src_compile() {
	./BuildAll.sh
	cd ../../build_lin
	./build.sh
	make || die
}

src_install() {
	make install || die

}

