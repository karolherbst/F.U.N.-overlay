# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3

inherit subversion python

DESCRIPTION="Generate Your Projects"
HOMEPAGE="http://code.google.com/p/gyp/source/"

ESVN_REPO_URI="http://gyp.googlecode.com/svn/trunk"
ESVN_PROJECT="${PN}"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
PYTHON_DEPEND="2"

pkg_setup() {
	python_set_active_version 2
}

src_compile() {
	./setup.py build || die
}

src_install() {
	./setup.py install --root="${D}" --prefix=/usr || die
	dodoc AUTHORS MANIFEST
}

