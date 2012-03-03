# Copyright 2010 Techwolf Lupindo
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit base subversion autotools flag-o-matic

DESCRIPTION="An open-source multi-platform crash reporting system"
HOMEPAGE="http://code.google.com/p/google-breakpad/"
ESVN_REPO_URI="http://google-breakpad.googlecode.com/svn/trunk/"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""

src_prepare() {
	eautoreconf
	eautomake
}

src_compile() {
	append-flags -fPIC 
	econf
	emake || die
}

src_install() {
	base_src_install
	# Install headers that some programs require to build.
	cd "${S}"
	insinto /usr/include/google_breakpad
	doins src/client/linux/handler/exception_handler.h
	insinto /usr/include/google_breakpad/common
	doins src/google_breakpad/common/*.h
	insinto /usr/include/google_breakpad/client/linux/minidump_writer
	doins src/client/linux/minidump_writer/*.h
	insinto /usr/include/google_breakpad/client/linux/crash_generation
	doins src/client/linux/crash_generation/*.h
	insinto /usr/include/google_breakpad/processor
	doins src/processor/scoped_ptr.h
}