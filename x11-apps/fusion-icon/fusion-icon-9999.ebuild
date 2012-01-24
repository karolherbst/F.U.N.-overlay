# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit git gnome2-utils python

EGIT_REPO_URI="git://anongit.compiz-fusion.org/users/crdlb/${PN}"
MINIMUM_COMPIZ_RELEASE="0.6.0"

DESCRIPTION="Compiz Fusion Tray Icon and Manager (git)"
HOMEPAGE="http://compiz-fusion.org"
SRC_URI=""

LICENSE="GPL-2"
SLOT="0"
KEYWORDS=""
IUSE="gtk qt4"

RDEPEND="
	|| ( ~dev-python/compizconfig-python-${PV}
		>=dev-python/compizconfig-python-${MINIMUM_COMPIZ_RELEASE} )
    dev-lang/python
	|| ( ~x11-wm/compiz-${PV}
		>=x11-wm/compiz-${MINIMUM_COMPIZ_RELEASE} )
	gtk? ( >=dev-python/pygtk-2.10 )
	qt4? ( dev-python/PyQt4 )"

DEPEND="${RDEPEND}
	>=dev-util/pkgconfig-0.19
	x11-apps/xvinfo"

S="${WORKDIR}/${PN}"

src_install() {
	use gtk && interfaces="${interfaces} gtk"
	use qt4 && interfaces="${interfaces} qt4"
	emake "interfaces=${interfaces}" DESTDIR="${D}" install || die "make install failed"
}

pkg_postinst() {
	python_version
	python_mod_optimize	"${ROOT}usr/$(get_libdir)/python${PYVER}"/site-packages/FusionIcon

	use gtk && gnome2_icon_cache_update

	ewarn "DO NOT report bugs to Gentoo's bugzilla"
	einfo "Please report all bugs to #gentoo-desktop-effects"
	einfo "Thank you on behalf of the Gentoo Desktop-Effects team"
}

pkg_postrm() {
	python_mod_cleanup
}
