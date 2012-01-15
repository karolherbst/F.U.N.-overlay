# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3

inherit eutils games

MY_PN="Shank"
DESCRIPTION="A side scrolling beat 'em up with a comic book art style"
HOMEPAGE="http://www.shankgame.com/"

HIBPAGE="http://www.humblebundle.com"
SRC_URI="${PN}-linux-${PVR//[[:alpha:]]/}-bin"

RESTRICT="fetch"
LICENSE=""

SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

DEPEND="app-arch/unzip"
RDEPEND="amd64? ( app-emulation/emul-linux-x86-sdl )
	 x86? ( media-libs/libsdl[audio,joystick,video] )"

S="${WORKDIR}/data"

GAMEDIR="${GAMES_PREFIX_OPT}/${PN}"

pkg_nofetch() {
	einfo ""
	einfo "Please buy and download \"${SRC_URI}\" from:"
	einfo "  ${HIBPAGE}"
	einfo "and move/link it to \"${DISTDIR}\""
	einfo ""
}

src_unpack() {
	local archive="${DISTDIR}/${A}"
	echo ">>> Unpacking ${archive} to ${PWD}"
	unzip -q "${archive}" 2> /dev/null
	[[ "${?}" -gt "1" ]] && die "unpacking \"${archive}\" failed"
}

src_install() {
	# Install data:
	insinto "${GAMEDIR}" || die "insinto \"${GAMEDIR}\" failed"
	doins -r data* || die "doins data failed"

	# Install executable:
	exeinto "${GAMEDIR}/bin" || die "exeinto \"${GAMEDIR}/bin\" failed"
	newexe "bin/${MY_PN}" "${PN}" || die "newexe \"${MY_PN}\" failed"
	# Used media-libs/fmod isn't in portage:
	exeinto "${GAMEDIR}/lib" || die "exeinto \"${GAMEDIR}/lib\" failed"
	doexe "bin/"libfmod*.so || die "doexe libs failed"

	# Make game wrapper:
	games_make_wrapper "${PN}" "./${PN}" "${GAMEDIR}/bin" "${GAMEDIR}/lib" || die "games_make_wrapper \"./${PN}\" failed"

	# Install icon and desktop file:
	local icon="${PN}.png"
	newicon "data/textures/ui/achievements/justgettingstarted.png" "${icon}" || die "newicon \"${icon}\" failed"
	make_desktop_entry "${PN}" "${MY_PN}" "/usr/share/pixmaps/${icon}" || die "make_desktop_entry failed"

	# Install documentation:
	find * -maxdepth 0 -type f -iname Readme*.txt -exec dodoc '{}' \; || die "dodoc failed"

	# Setting permissions:
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
}
