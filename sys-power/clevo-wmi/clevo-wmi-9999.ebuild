# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="4"

inherit git-2 linux-mod

DESCRIPTION="WMI driver for Clevo laptops"
HOMEPAGE="http://forum.notebookreview.com/linux-compatibility-software/708796-clevo-p150em-p170em-sager-np9150-9170-backlit-keyboard-driver-beta-testers-needed.html"
EGIT_REPO_URI="git://git.code.sf.net/p/${PN}/code"
SRC_URI=""

SLOT="0"
LICENSE="GPL-2"
KEYWORDS=""
IUSE=""

DEPEND="virtual/linux-sources
	sys-kernel/linux-headers"

RDEPEND=""

MODULE_NAMES="clevo_wmi(wmi:${S})"

pkg_pretend() {
	CONFIG_CHECK="ACPI_WMI"
	check_extra_config
}

pkg_setup() {
	linux-mod_pkg_setup
	BUILD_TARGETS="all"
}
