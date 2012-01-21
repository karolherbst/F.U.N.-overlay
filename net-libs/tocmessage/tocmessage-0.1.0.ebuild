# copyright ToC

EAPI="0"

inherit cmake-utils

DESCRIPTION="a simple protocol for the TOC project"
HOMEPAGE="http://karolherbst.de/toc/tocmessage.html"
SRC_URI="http://karolherbst.de/toc/archives/${PN}/${PN}-${PV}.tar.gz"

KEYWORDS="~amd64"
SLOT="0"
DEPEND="dev-libs/boost
        dev-libs/tocstring"
RDEPEND="dev-libs/boost
         dev-libs/tocstring"

src_test() {
    cd "${CMAKE_BUILD_DIR}" || die
    Xemake test
}
