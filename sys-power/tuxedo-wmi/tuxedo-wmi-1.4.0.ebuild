# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="5"

inherit linux-mod

DESCRIPTION="A driver for the Clevo P15xSM(1)(-A)/P17xSM(-A)/P370SM-A Laptop models"
HOMEPAGE="http://www.linux-onlineshop.de/forum/index.php?page=Thread&threadID=26"
SRC_URI="http://www.linux-onlineshop.de/forum/index.php?page=Attachment&attachmentID=262&h=98b12b8ddff00c49706504583dbaf5edb1ec3980&s=f3ceb43cbfbaa1d5f9906a395a1d425bb4d69135 -> ${P}.tar.gz"

SLOT="0"
LICENSE="GPL-2+"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="
	sys-kernel/linux-headers
	virtual/linux-sources
"
RDEPEND=""

MODULE_NAMES="tuxedo-wmi(wmi:${S}/src)"
BUILD_TARGETS="all"
CONFIG_CHECK="ACPI_WMI"

src_compile() {
	BUILD_PARAMS="KDIR=${KV_OUT_DIR}"
	linux-mod_src_compile
}

src_install() {
	linux-mod_src_install
	insinto /etc/modprobe.d
	doins "${FILESDIR}"/tuxedo_wmi.conf
}
