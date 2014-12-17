# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="4"

inherit linux-mod

DESCRIPTION="A driver for the Clevo P150EM/P170EM/P150SM/P157SM/P170SM/P177SM backlight keyboard"
HOMEPAGE="http://www.linux-onlineshop.de/forum/index.php?page=Thread&threadID=26"
SRC_URI="http://www.linux-onlineshop.de/forum/index.php?page=Attachment&attachmentID=262&h=98b12b8ddff00c49706504583dbaf5edb1ec3980&s=f3ceb43cbfbaa1d5f9906a395a1d425bb4d69135 -> ${P}.tar.gz"

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
