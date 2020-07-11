# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="Create Pentoo VirtualBox VMs using packer and vagrant"
HOMEPAGE="https://github.com/wuodan/pentoo-packer"

LICENSE="MPL-2.0"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DOCS="README.md"

inherit git-r3

EGIT_REPO_URI="https://github.com/Wuodan/${PN}.git"
EGIT_BRANCH="2020"

RDEPEND="
	app-emulation/vagrant
	|| ( app-emulation/virtualbox app-emulation/virtualbox-bin )
	app-misc/jq
	dev-util/packer
"

src_install() {
	exeinto /usr/bin/
	newexe pentoo-packer.sh pentoo-packer
	insinto /usr/share/${PN}/
	doins Vagrantfile pentoo.json
	einstalldocs
}