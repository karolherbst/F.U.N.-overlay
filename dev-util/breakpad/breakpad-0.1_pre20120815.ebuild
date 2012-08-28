# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

inherit autotools eutils

DESCRIPTION="An open-source multi-platform crash reporting system"
HOMEPAGE="http://code.google.com/p/google-breakpad/"
SRC_URI="mirror://github/jauhien/sources/${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="processor test tools"

RDEPEND="net-misc/curl"
DEPEND="${RDEPEND}"

REQUIRED_USE="test? ( tools )"

src_prepare() {
	#omitting libdisasm as it is modified and lss as it is just header
	rm -r src/third_party/{curl,glog,linux,protobuf} \
		|| die "removing bundled headers failed"

	sed \
		-e 's/COPYING//' \
		-e 's/INSTALL//' \
		-i Makefile.am \
		|| die "removing doc install rules failed"

	sed \
		-e "s/AC_INIT(breakpad, 0.1/AC_INIT(${PN}, ${PV}/" \
		-i configure.ac \
		|| die "fixing program version failed"
	cp "${FILESDIR}"/${PN}.pc.in ./ || die
	epatch "${FILESDIR}"/${P}-{curl,headers}.patch

	eautoreconf
}

src_configure() {
	econf \
		$(use_enable processor) \
		$(use_enable tools) \
		$(use_enable test selftest)
}
