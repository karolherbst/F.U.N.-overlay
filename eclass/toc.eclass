inherit cmake-utils

EAPI="0"

TOCDEPEND="
    dev-libs/boost
    dev-util/cmake"

# tocenv should not be depend on itselfs
[[ ${PN} = tocenv ]] || TOCDEPEND+=" dev-util/tocenv "

DEPEND="${TOCDEPEND}"
HOMEPAGE="http://karolherbst.de/toc/${PN}.html"
KEYWORDS="~amd64"
RDEPEND="${DEPEND}"
SRC_URI="http://karolherbst.de/toc/archives/${PN}/${PN}-${PV}.tar.gz"
SLOT="0"
IUSE="c++0x pch"

toc_src_configure() {
    mycmakeargs="
        $(cmake-utils_use   c++0x     TOC_USE_C++X0)
        $(cmake-utils_use   pch       TOC_USE_PCH)
    "
    cmake-utils_src_configure
}
