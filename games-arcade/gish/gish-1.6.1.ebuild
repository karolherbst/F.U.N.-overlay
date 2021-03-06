# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit eutils games versionator

MY_PV=$(delete_all_version_separators ${MY_PV})
MY_P="${PN}${MY_PV}"
MY_R="-1"

DESCRIPTION="Play as an amorphous ball of tar that rolls and squishes around"
HOMEPAGE="http://www.chroniclogic.com/gish.htm"
SRC_URI="${MY_P}${MY_R}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="-* amd64 x86"
IUSE=""
RESTRICT="strip fetch"
QA_EXECSTACK="${GAMES_PREFIX_OPT:1}/${PN}/gish"

RDEPEND="media-libs/libsdl
	media-libs/sdl-image
	media-libs/libvorbis
	media-libs/openal
	virtual/opengl"

S="${WORKDIR}/${MY_P}"

pkg_nofetch() {
	einfo "This game must be purchased from ${HOMEPAGE}."
	einfo "You will receive instructions on how to download ${MY_P}${MY_R}.tar.gz. Place"
	einfo "this file in ${DISTDIR} once you have it and then restart"
	einfo "this merge."
}

src_install() {
	local dir=${GAMES_PREFIX_OPT}/${PN}

	insinto "${dir}"
	doins -r animation level music replay sound texture tile?? || die

	exeinto "${dir}"
	if use amd64; then
		doexe ${PN}64 || die
		games_make_wrapper ${PN} ./${PN}64 "${dir}" || die
	else
		doexe ${PN} || die
		games_make_wrapper ${PN} ./${PN} "${dir}" || die
	fi

	doicon ${PN}.bmp || die
	make_desktop_entry ${PN} "Gish" ${PN}.bmp || die

	#dodoc *.txt
	#dohtml -A swf *.html *.swf

	prepgamesdirs
}

pkg_postinst() {
	ewarn "This game is known to crash shortly after starting level 1-6. You can"
	ewarn "work around this by turning off the music just for that level. This has"
	ewarn "been reported upstream."
	ewarn
	ewarn "Due to a bug in this version of Gish, saving games and configuration settings"
	ewarn "is broken by default. To enable, you must run the following command as root:"
	ewarn "   chmod g+w ${GAMES_PREFIX_OPT}/${PN}"
	ewarn "Note that this allows write access to the installed game directory, which"
	ewarn "is a Bad Thing for security, and that your settings/games will be shared"
	ewarn "among all users of your system."
}
