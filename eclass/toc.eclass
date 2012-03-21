# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License, v2 or later
# @author: Karol Herbst <projects@karolherbst.de>

inherit cmake-utils

EAPI="2"

TOCDEPEND="
    dev-libs/boost
    dev-util/cmake"

# tocenv should not be depend on itselfs
[[ ${PN} = tocenv ]] || TOCDEPEND+=" dev-util/tocenv "

if [[ ${PV} == "9999" ]] ; then
    EGIT_REPO_URI="git://github.com/karolherbst/${PN}.git"
    inherit git-2
    KEYWORDS=""
else
    MY_P="${PN}-${PV}"
    SRC_URI="https://github.com/downloads/karolherbst/${PN}/${PF}.tar.gz"
    S=${WORKDIR}/${MY_P}
    KEYWORDS="~amd64"
fi

DEPEND="${TOCDEPEND}"
HOMEPAGE="https://github.com/karolherbst/${PN}"
RDEPEND="${DEPEND}"
SLOT="0"
IUSE="c++0x pch"

toc_src_configure() {
    mycmakeargs="
        $(cmake-utils_use   c++0x     TOC_USE_C++X0)
        $(cmake-utils_use   pch       TOC_USE_PCH)
    "
    cmake-utils_src_configure
}

EXPORT_FUNCTIONS src_configure
