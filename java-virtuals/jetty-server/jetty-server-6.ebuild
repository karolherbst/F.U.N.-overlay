# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/virtual/ssh/ssh-0.ebuild,v 1.1 2011/04/16 19:27:07 ulm Exp $
EAPI="2"

inherit java-virtuals-2

DESCRIPTION="Virtual for Jetty www server"
HOMEPAGE=""
SRC_URI=""

LICENSE=""
SLOT="${PV}"
KEYWORDS="amd64 x86"
IUSE=""

DEPEND=""
RDEPEND="|| ( 
	www-servers/jetty:${SLOT}
	www-servers/jetty-bin:${SLOT}
	www-servers/jetty-eclipse:${SLOT}
	www-servers/jetty-eclipse-bin:${SLOT}
	)
	>=dev-java/java-config-2.1.8"

JAVA_VIRTUAL_PROVIDES="jetty-${SLOT} jetty-bin-${SLOT} jetty-eclipse-${SLOT} jetty-eclipse-bin-${SLOT}"
