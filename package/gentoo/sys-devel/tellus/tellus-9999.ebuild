# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit git-r3

DESCRIPTION="Host Intrusion Detection and Prevention System Based on Kernel Module"
HOMEPAGE="https://github.com/lanthora/tellus"
EGIT_REPO_URI="${HOMEPAGE}"

LICENSE="GPL"
SLOT="0"
KEYWORDS="~amd64 ~arm64 ~arm"

DEPEND="dev-libs/libnl
		"
RDEPEND="${DEPEND}"
BDEPEND="dev-vcs/git
		 dev-util/cmake
		 sys-devel/make
		 dev-lang/go
		 dev-cpp/nlohmann_json
		"

src_compile(){
	make gentoo-build
}

src_install(){
	make install
}
