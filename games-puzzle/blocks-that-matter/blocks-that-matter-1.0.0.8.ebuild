# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=2

MY_ARCH="${ARCH/amd64/x64}"

inherit eutils games java-pkg-2

DESCRIPTION="You are the Tetrobot: a tiny robot that can drill blocks of matter one by one, collect them, and recycle them into new pieces of 4 blocks."
HOMEPAGE="http://www.swingswingsubmarine.com/"

HIBPAGE="http://www.humblebundle.com"
SRC_URI="blocks-matter_${PV}_${MY_ARCH}.tar.gz"

RESTRICT="fetch"
LICENSE=""

SLOT="0"
KEYWORDS="amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="virtual/jre
	media-libs/openal"

S="${WORKDIR}/blocks-matter_${PV}_${MY_ARCH}"

GAMEDIR="${GAMES_PREFIX_OPT}/${PN}"

pkg_nofetch() {
	einfo ""
	einfo "Please buy and download \"${SRC_URI}\" from:"
	einfo "  ${HOMEPAGE} or ${HIBPAGE}"
	einfo "and move/link it to \"${DISTDIR}\""
	einfo ""
}

pkg_setup() {
	java-pkg-2_pkg_setup
	games_pkg_setup
}

src_prepare() {
	sed -i -e 's;\./bin/java;java;' BTM_launcher_linux.sh || dir "java fix"
}

# nothing to do ... stubs for eclasses
src_configure() { :; }
src_compile() { :; }

src_install() {
	local dir="${GAMES_PREFIX_OPT}/${PN}"

	exeinto "${dir}"
	doexe *.{sh,so} || die "install executables"

	insinto "${dir}"
	doins -r *.bftm *.jar BTM_lib/ Community/ config/ Blocks\ That\ Matter\ Save/ || die "install resources"

	dodoc README/*

	games_make_wrapper ${PN} ./BTM_launcher_linux.sh "${GAMEDIR}" "${GAMEDIR}"
	doicon BTM.ico
	make_desktop_entry ${PN} "Blocks That Matter" BTM_launcher_linux.sh

	prepgamesdirs
}

pkg_preinst() {
	java-pkg-2_pkg_preinst
	games_pkg_preinst
}
