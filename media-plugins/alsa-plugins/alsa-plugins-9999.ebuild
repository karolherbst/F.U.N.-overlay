# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/media-plugins/alsa-plugins/alsa-plugins-1.0.24.ebuild,v 1.8 2011/12/29 21:34:51 halcy0n Exp $

EAPI=3

MY_P="${P/_/}"

inherit autotools base flag-o-matic git-2

DESCRIPTION="ALSA extra plugins"
HOMEPAGE="http://www.alsa-project.org/"
SRC_URI=""
EGIT_REPO_URI="git://git.alsa-project.org/alsa-plugins.git"

LICENSE="GPL-2 LGPL-2.1"
SLOT="0"
KEYWORDS=""
IUSE="debug ffmpeg jack libsamplerate pulseaudio speex"

RDEPEND=">=media-libs/alsa-lib-${PV}[alsa_pcm_plugins_ioplug]
	ffmpeg? ( virtual/ffmpeg
		media-libs/alsa-lib[alsa_pcm_plugins_rate,alsa_pcm_plugins_plug] )
	jack? ( >=media-sound/jack-audio-connection-kit-0.98 )
	libsamplerate? (
		media-libs/libsamplerate
		media-libs/alsa-lib[alsa_pcm_plugins_rate,alsa_pcm_plugins_plug] )
	pulseaudio? ( media-sound/pulseaudio )
	speex? ( media-libs/speex
		media-libs/alsa-lib[alsa_pcm_plugins_rate,alsa_pcm_plugins_plug] )
	!media-plugins/alsa-jack"

DEPEND="${RDEPEND}
	dev-util/pkgconfig"

PATCHES=(
	"${FILESDIR}/${PN}-1.0.19-missing-avutil.patch"
	"${FILESDIR}/${PN}-1.0.23-automagic.patch"
)

S="${WORKDIR}/${MY_P}"

src_unpack() {
	git-2_src_unpack
	cd "${S}"
}

src_prepare() {
	base_src_prepare

	# For some reasons the polyp/pulse plugin does fail with alsaplayer with a
	# failed assert. As the code works just fine with asserts disabled, for now
	# disable them waiting for a better solution.
	sed -i -e '/AM_CFLAGS/s:-Wall:-DNDEBUG -Wall:' \
		"${S}/pulse/Makefile.am"

	eautoreconf
}

src_configure() {
	use debug || append-flags -DNDEBUG

	local myspeex

	if use speex; then
		myspeex=lib
	else
		myspeex=no
	fi

	econf \
		--disable-dependency-tracking \
		$(use_enable ffmpeg avcodec) \
		$(use_enable jack) \
		$(use_enable libsamplerate samplerate) \
		$(use_enable pulseaudio) \
		--with-speex=${myspeex}
}

src_install() {
	emake DESTDIR="${D}" install

	cd "${S}/doc"
	dodoc upmix.txt vdownmix.txt README-pcm-oss
	use jack && dodoc README-jack
	use libsamplerate && dodoc samplerate.txt
	use ffmpeg && dodoc lavcrate.txt a52.txt

	if use pulseaudio; then
		dodoc README-pulse
		# install ALSA configuration files
		# making PA to be used by alsa clients
		insinto /usr/share/alsa
		doins "${FILESDIR}"/pulse*.conf
	fi

}
