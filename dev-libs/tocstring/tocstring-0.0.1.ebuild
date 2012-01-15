# copyright ToC

EAPI="0"

inherit cmake-utils

DESCRIPTION="a collection of simple string routines for c++ using boost and other libraries"
KEYWORDS="amd64"
HOMEPAGE="http://karolherbst.de/toc/tocstring.html"
SRC_URI="http://karolherbst.de/toc/archives/${PN}/${PN}-${PV}.tar.gz"

KEYWORDS="~amd64"
SLOT="0"
DEPEND=""
RDEPEND="dev-libs/boost"

src_test() {
    cd "${CMAKE_BUILD_DIR}" || die
    Xemake test
}
