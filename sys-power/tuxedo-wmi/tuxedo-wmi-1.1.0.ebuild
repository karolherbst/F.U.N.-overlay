# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="4"

inherit linux-mod

DESCRIPTION="A driver for the Clevo P150EM/P170EM/P150SM/P157SM/P170SM/P177SM backlight keyboard"
HOMEPAGE="http://www.linux-onlineshop.de/forum/index.php?page=Thread&threadID=26"
SRC_URI="http://www.linux-onlineshop.de/forum/index.php?page=Attachment&attachmentID=76&h=e1c3a51c297ded51bbddfac915ec65a050f576ca&s=b82ceafa7a0be87d9192dfd7c617261f027cde27 -> ${P}.tar.gz"

SLOT="0"
LICENSE="GPL-2"
KEYWORDS=""
IUSE=""

DEPEND="virtual/linux-sources
	sys-kernel/linux-headers"

RDEPEND=""

S="${S}/src/"

MODULE_NAMES="tuxedo-wmi(wmi:${S})"

pkg_pretend() {
	CONFIG_CHECK="ACPI_WMI"
	check_extra_config
}

pkg_setup() {
	linux-mod_pkg_setup
	BUILD_TARGETS="all"
}
