# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/media-sound/teamspeak-client-bin/teamspeak-client-bin-3.0.1.ebuild,v 1.1 2011/08/26 15:08:21 cthulhu Exp $

EAPI=2

inherit eutils

DESCRIPTION="TeamSpeak Client - Voice Communication Software"
HOMEPAGE="http://teamspeak.com/"
LICENSE="teamspeak3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""
RESTRICT="strip"
PROPERTIES="interactive"
LANGS="ca de en es fr pt ru"
for x in ${LANGS} ; do
	IUSE="${IUSE} linguas_${x}"
done
RESTRICT="strip"
SRC_URI="
	amd64? ( http://teamspeak.gameserver.gamed.de/ts3/releases/3.0.2/TeamSpeak3-Client-linux_amd64-3.0.2.run )
	x86? ( http://teamspeak.gameserver.gamed.de/ts3/releases/3.0.2/TeamSpeak3-Client-linux_amd64-3.0.2.run )
"

DEPEND=""
RDEPEND="${DEPEND}
		>=media-libs/libpng-1.4
		>=x11-libs/qt-gui-4.7[accessibility]
		>=x11-libs/libXinerama-1.0.2"

src_unpack() {
	# TODO: unpack_makeself -- use this version once it supports makeself 2.1.6
	for i in ${A}; do
		sh "${DISTDIR}/${i}" --target "${WORKDIR}" || die "unpack failed"
	done
}

src_install() {
	local dest="${D}/opt/teamspeak3-client"

	mkdir -p "${dest}"

	# remove the qt-libraries as they just cause trouble with the system's Qt
	# see bug #328807
	rm "${WORKDIR}"/libQt* || die

	cp -R "${WORKDIR}/"* "${dest}/" || die

	exeinto /usr/bin
	doexe "${FILESDIR}/teamspeak3"

	mv "${dest}/ts3client_linux_"* "${dest}/ts3client"

	make_desktop_entry teamspeak3 TeamSpeak3 \
		"/opt/teamspeak3-client/gfx/default/24x24_connect.png" \
		Network
	# translations
	local lang=
	for lang in ${LINGUAS}; do
		# de and en are handled internally
		if [[ ${lang} != de ]] && [[ ${lang} != en ]]; then
			cp "${FILESDIR}/linguas_${lang}/styles/default/"* "${dest}/styles/default/" || die
			cp "${FILESDIR}/linguas_${lang}/translations/"* "${dest}/translations/" || die
		fi
	done
}

