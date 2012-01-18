# Copyright 1999-2006 Gentoo Foundation 
# Distributed under the terms of the GNU General Public License v2 

inherit eutils 

DESCRIPTION="A cross-platform benchmark suite for Mac OS X, Windows, and Linux." 
SRC_URI="http://s3.amazonaws.com/geekbench/Geekbench-${PV}-Linux.tar.gz" 
HOMEPAGE="http://www.geekpatrol.ca/geekbench/" 
RESTRICT="nostrip" 

KEYWORDS="-* ~x86" 
SLOT="0" 
IUSE="" 
RDEPEND=">=sys-devel/gcc-4.0.2-r3" 

src_unpack() { 
        unpack Geekbench-${PV}-Linux.tar.gz
} 

src_compile() { 
        einfo "Nothing to compile" 
} 

src_install() { 
        cd ${PORTAGE_TMPDIR}/portage/geekbench-bin-${PV}/work/dist/Geekbench-${PV}-Linux

        dobin geekbench 
} 
