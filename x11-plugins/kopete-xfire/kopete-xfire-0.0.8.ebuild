# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
inherit kde4-base

DESCRIPTION="Xfire network support for kopete"
HOMEPAGE="http://code.google.com/p/kopete-xfire/"
SRC_URI="http://kopete-xfire.googlecode.com/files/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="4"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="
	$(add_kdebase_dep kopete)
"
DEPEND="${RDEPEND}"

S="${WORKDIR}/${PN}"
