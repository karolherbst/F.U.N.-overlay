# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/media-sound/teamspeak-client-bin/teamspeak-client-bin-3.0.6.ebuild,v 1.1 2012/05/09 11:49:45 polynomial-c Exp $

EAPI=2

inherit eutils unpacker

DESCRIPTION="TeamSpeak Client - Voice Communication Software"
HOMEPAGE="http://teamspeak.com/"
LICENSE="teamspeak3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""
RESTRICT="strip"
LANGS="ca de en es fr pt ru"
for x in ${LANGS} ; do
	IUSE="${IUSE} linguas_${x}"
done
RESTRICT="strip"
SRC_URI="
	amd64? ( http://teamspeak.gameserver.gamed.de/ts3/releases/${PV}/TeamSpeak3-Client-linux_amd64-${PV}.run )
	x86? ( http://teamspeak.gameserver.gamed.de/ts3/releases/${PV}/TeamSpeak3-Client-linux_x86-${PV}.run )
"

DEPEND=""
RDEPEND="${DEPEND}
		>=media-libs/libpng-1.4
		>=x11-libs/qtgui-4.7[accessibility]
		>=x11-libs/libXinerama-1.0.2"

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
