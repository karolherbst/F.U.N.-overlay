# copyright ToC

EAPI="0"

inherit cmake-utils

DESCRIPTION="a simple string based exception classed with several macros"
HOMEPAGE="http://karolherbst.de/toc/tocexception.html"
SRC_URI="http://karolherbst.de/toc/archives/${PN}/${PN}-${PV}.tar.gz"

KEYWORDS="~amd64"
SLOT="0"
DEPEND="dev-libs/boost"
RDEPEND="dev-libs/boost"

src_test() {
    cd "${CMAKE_BUILD_DIR}" || die
    Xemake test
}
