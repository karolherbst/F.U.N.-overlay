# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3

inherit eutils games

MY_PN="SuperMeatBoy"
DESCRIPTION="A platformer where you play as an animated cube of meat"
HOMEPAGE="http://www.supermeatboy.com/"

HIBPAGE="http://www.humblebundle.com"
SRC_URI="${PN}-linux-${PV}b-bin"

RESTRICT="fetch"
LICENSE="as-is"

SLOT="0"
KEYWORDS="-* ~amd64 ~x86"
IUSE="-bundled-libs"

DEPEND="app-arch/unzip"
RDEPEND="!bundled-libs? (
	    =media-libs/libsdl-1.2*
	    =media-libs/openal-1* )"

S="${WORKDIR}/data"
GAMEDIR="${GAMES_PREFIX_OPT}/${PN}"

pkg_nofetch() {
	einfo ""
	einfo "Please buy and download \"${SRC_URI}\" from:"
	einfo "   ${HIBPAGE}"
	einfo "and move/link it to \"${DISTDIR}\""
	einfo ""
}

src_unpack() {
	local archive="${DISTDIR}/${A}"
	echo ">>> Unpacking ${A} to ${PWD}"
	unzip -q "${archive}" 2> /dev/null
	[[ "${?}" -gt "1" ]] && die "unpacking \"${archive}\" failed"
}

src_install() {
	# Data:
	insinto "${GAMEDIR}" || die "insinto \"${GAMEDIR}\" failed"
	doins -r "resources" || die "doins \"resources\" failed"
	find . -maxdepth 1 -mindepth 1 -type f ! -executable \( -iname "*.cfg" -o \
								-iname "*.dat" -o \
								-iname "*.txt" \) \
								! -iname "*readme*" -exec doins -r '{}' \+ || die "doins data failed"

	# Executable and libraries:
	exeinto "${GAMEDIR}" || die "exeinto \"${GAMEDIR}\" failed"
	newexe "${ARCH}/${MY_PN}-${ARCH}" "${PN}" || die "newexe \"${PN}\" failed"
	use bundled-libs && ( 
	  exeinto "${GAMEDIR}/lib" || die "exeinto \"${GAMEDIR}/lib\" failed"
	  doexe "${ARCH}/"lib*so* || die "doexe bundled libs failed" )

	# Make game wrapper:
	games_make_wrapper "${PN}" "./${PN}" "${GAMEDIR}" "$(usex "bundled-libs" "${GAMEDIR}/lib" "")" || die "games_make_wrapper \"./${PN}\" failed"

	# Icon and desktop files:
	local icon="${PN}.png"
	newicon "${icon}" "${icon}" || die "newicon \"${icon}\" failed"
	make_desktop_entry "${PN}" "${MY_PN}" "/usr/share/pixmaps/${icon}" || die "make_desktop_entry failed"

	# Documents:
	find . -maxdepth 1 -mindepth 1 -type f ! -executable -iname "readme*.txt" -exec dodoc '{}' \+ || die "dodoc failed"

	# Setting general permissions:
	prepgamesdirs
}

pkg_postinst() {
	echo ""
	games_pkg_postinst

	einfo "Please report any bugs here:"
	einfo "   http://bugzilla.icculus.org/"
	echo ""
	einfo "${MY_PN} savegames and configurations are stored in:"
	einfo "   \${HOME}/.local/share/${MY_PN}"
	echo ""
	einfo "To play, run:"
	einfo "   ${PN}"
	echo ""
}
