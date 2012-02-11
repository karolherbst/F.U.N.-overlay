# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="3"

inherit eutils games

MY_P="Unigine_Heaven-${PV}"

DESCRIPTION="GPU benchmark with interactive mode"
HOMEPAGE="http://www.unigine.com/products/heaven/"
SRC_URI="${MY_P}.run"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

RDEPEND=""

RESTRICT="fetch strip"

S="${WORKDIR}"

my_dir="${GAMES_PREFIX_OPT}/${P}"

pkg_nofetch() {
	einfo "Please, download it from:"
	einfo "http://www.unigine.com/download/#heaven"
}

pkg_setup() {
	games_pkg_setup
}

src_unpack() {
	unpack_makeself
}

src_install() {
	insinto "${my_dir}"
	doins -r "${S}"/data

	exeinto "${my_dir}"/bin
	doexe "${S}"/bin/*

	exeinto "${my_dir}"
	doexe "${S}"/*.sh

	games_make_wrapper Heaven_x64 "./Heaven_x64" "${my_dir}"/bin
	games_make_wrapper Heaven_x86 "./Heaven_x86" "${my_dir}"/bin
}

pkg_postinst() {
	einfo "Example scripts for ${PN} can be found here:"
	einfo "${my_dir}"
}
