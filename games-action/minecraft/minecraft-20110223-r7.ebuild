# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"
inherit eutils games java-pkg-2

DESCRIPTION="A game about placing blocks while running from skeletons. Or something like that..."
HOMEPAGE="http://www.minecraft.net"
SRC_URI="http://www.minecraft.net/download/minecraft.jar -> $P.jar"
LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="ipv6"
RESTRICT="mirror"

# lwjgl 2.4 is used by upstream but we're using 2.6+ because of reports
# that it fixes a bug where keyboard controls get stuck. You can
# determine what version upstream uses by looking for the version number
# near the top of...
#
#  javap -classpath lwjgl.jar -c org.lwjgl.Sys

DEPEND=">=virtual/jdk-1.5" # Only need this for jar.

RDEPEND=">=dev-java/jinput-1_pre20100416
	>=dev-java/lwjgl-2.8.3:2.8
	|| ( >=dev-java/icedtea-bin-6[X]
		>=dev-java/icedtea-6
		>=dev-java/oracle-jre-bin-1.6[X]
		>=dev-java/oracle-jdk-bin-1.6[X]
		>=dev-java/sun-jre-bin-1.6[X]
		>=dev-java/sun-jdk-1.6[X] )"

S="${WORKDIR}"

pkg_setup() {
	java-pkg-2_pkg_setup
	games_pkg_setup
}

src_prepare() {
	# Don't download or install JAR libraries. Hacky but works.
	sed -i "s/lwjgl.jar, jinput.jar, lwjgl_util.jar,/                                      /g" \
		net/minecraft/GameUpdater.class || die

	# Recreate JAR.
	jar cfe "${PN}.jar" net.minecraft.MinecraftLauncher LZMA/ net/ || die
}

src_install() {
	java-pkg_register-dependency jinput,lwjgl-2.8
	java-pkg_dojar "${PN}.jar"

	local ARGS
	use ipv6 || ARGS="-Djava.net.preferIPv4Stack=true"

	# Launching with -jar seems to create classpath problems.
	java-pkg_dolauncher "${PN}" -into "${GAMES_PREFIX}" \
		-pre "${FILESDIR}/native-symlinks.sh" \
		--java_args "-Xmx1024M -Xms512M ${ARGS}" \
		--main net.minecraft.MinecraftLauncher

	doicon "${FILESDIR}/${PN}.png" || die
	make_desktop_entry "${PN}" "Minecraft"

	prepgamesdirs
}

pkg_postinst() {
	ewarn "We have patched Minecraft to use libraries built from source for your"
	ewarn "own system. If you encounter problems, PLEASE also try the official"
	ewarn "version before reporting them upstream. Make sure that you delete"
	ewarn "~/.minecraft/bin/version and ~/.minecraft/bin/natives before using the"
	ewarn "official version so that the libraries can be downloaded by the game."
	echo

	games_pkg_postinst
}
