# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="3"
inherit check-reqs eutils games

MY_PN="${PN^}"

DESCRIPTION="An original action role-playing game set in a lush imaginative world"
HOMEPAGE="http://supergiantgames.com/"
HIB_HOMEPAGE="http://www.humblebundle.com/"

SRC_URI="Bastion-HIB-${PV:0:4}-${PV:4:2}-${PV:6:2}-${PR//[[:alpha:]]}.sh"
LICENSE="as-is"

SLOT="0"
KEYWORDS="-* ~amd64 ~x86"

IUSE="bundled-libs"
RESTRICT="fetch strip"

DEPEND="app-arch/tar
	app-arch/xz-utils"

RDEPEND="media-libs/freealut
	 media-libs/openal
	 media-libs/sdl-gfx
	 media-libs/sdl-image
	 media-libs/sdl-mixer
	 media-libs/sdl-net
	 media-libs/sdl-ttf
	 media-libs/smpeg
	 virtual/opencl
	 virtual/opengl
	 x11-libs/libX11
	 !bundled-libs? (
	   dev-lang/mono
	   media-libs/fmod:1
	   media-libs/libsdl )"

S="${WORKDIR}"
GAMEDIR="${GAMES_PREFIX_OPT}/${PN}"

pkg_nofetch() {
	einfo ""
	einfo "Please download \"${SRC_URI}\" from:"
	einfo "  ${HIB_HOMEPAGE}"
	einfo "and move/link it to \"${DISTDIR}\""
	einfo ""
}

src_unpack() {
	# Data files are two archives ("instarchive_all" and "instarchive_linux_${ARCH}") inside an archive ("subarch") inside the downloaded self-extracting archive:
	# unpacker eclass handles the last one and unpack can extract the others but we'll use a pipe when possible to save space.

	CHECKREQS_DISK_BUILD="2400M"
	check-reqs_pkg_setup

	local archive="${DISTDIR}/${A}"
	local data_size="$(grep --binary-file=text --max-count=1 --regexp="filesizes=\"[0-9]*\"" "${archive}" | cut --delimiter='"' --fields=2)"
	local data_files="instarchive_all instarchive_linux_${ARCH} ${MY_PN}.png"

	if [[ "${?}" == "0" && "${data_size}" =~ ^[0-9]+$ ]]
	then
	  echo ">>> Unpacking ${A} to ${PWD}"
	  ( tail --bytes=${data_size} "${archive}" | tar --extract --gzip --to-stdout --file - "./subarch" \
						   | tar --extract --lzma --file - --transform="s/^instarchive.*$/&.tar.lzma/" ${data_files} &&
	  unpack ./*.tar.lzma ) || die "unpacking \"${archive}\" failed"
	  rm -f ./*.tar.lzma || die "remove \"${archive}\" failed"
	fi || die "processing \"${archive}\" failed"
}

src_install() {
	# Install exec, libs, icon and readme first, so only data remains:
	insinto "${GAMEDIR}" || die "insinto \"${GAMEDIR}\" failed"
	exeinto "${GAMEDIR}" || die "exeinto \"${GAMEDIR}\" failed"

	local executable="${MY_PN}.bin.${ARCH}"

	# Install executables and libraries:
	doexe "${executable}" || die "doexe \"${executable}\" failed"
	rm -f "${executable}" || die "remove \"${executable}\" failed"

	if use bundled-libs
	then
	  exeinto "${GAMEDIR}/lib" || die "exeinto \"${GAMEDIR}/lib\" failed"
	  doexe lib*/* || die "doexe \"lib\" failed"
	fi
	rm -fr lib* || die "remove libs failed"

	# Make game wrapper:
	games_make_wrapper "${PN}" "./${executable}" "${GAMEDIR}" "$( usex "bundled-libs" "${GAMEDIR}/lib" "" )" || die "games_make_wrapper \"${PN}\" failed"

	# Install icon:
	newicon "${MY_PN}.png" "${PN}.png" || die "newicon \"${PN}.png\" failed"
	rm -f *.png || die "remove icon failed"

	# Make desktop file:
	make_desktop_entry "${PN}" "${MY_PN}" "/usr/share/pixmaps/${PN}.png" || die "make_desktop_entry failed"

	# Install docs:
	dodoc README* || die "dodoc failed"
	rm -f README* || die "remove documentation failed"

	# Install data files:
	doins -r * || die "doins \"data\" failed"

	# Setting permissions
	prepgamesdirs
}

pkg_postinst() {
	echo ""
	games_pkg_postinst

	einfo "${MY_PN} savegames and configurations are stored in:"
	einfo "   \${HOME}/.SupergiantGames/${MY_PN}"
	echo ""
}