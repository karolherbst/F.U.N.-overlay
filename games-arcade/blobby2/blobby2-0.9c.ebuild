# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3
inherit games cmake-utils

MY_PN="${PN}-linux"
DESCRIPTION="The new Blobby Volley, a volley-game with colorful blobs"
HOMEPAGE="http://blobby.sourceforge.net"
SRC_URI="mirror://sourceforge/blobby/${MY_PN}-${PV}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="virtual/opengl
	media-libs/libsdl
	dev-games/physfs"
DEPEND="${RDEPEND}"

S="${WORKDIR}/blobby-beta-${PV}"

src_install() {
	cmake-utils_src_install
	prepgamesdirs
}

