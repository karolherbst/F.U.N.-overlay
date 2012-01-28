# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/virtual/opencl/opencl-0.ebuild,v 1.2 2011/12/20 22:09:15 vapier Exp $

EAPI="4"

DESCRIPTION="Virtual for OpenCL implementations"

SLOT="0"
KEYWORDS="~amd64 ~x86"
CARDS=( fglrx nvidia )
IUSE="${CARDS[@]/#/video_cards_}"

REQUIRED_USE="|| ( ${IUSE} )"

RDEPEND="app-admin/eselect-opencl
	|| (
		video_cards_fglrx? ( >=x11-drivers/ati-drivers-11.2[opencl] )
		video_cards_nvidia? ( >=x11-drivers/nvidia-drivers-290.10 )
	)"