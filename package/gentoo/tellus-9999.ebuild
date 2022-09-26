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
		sys-kernel/dkms
		"
RDEPEND="${DEPEND}"
BDEPEND="
	dev-vcs/git
	dev-util/cmake
	sys-devel/make
	dev-lang/go
	dev-cpp/nlohmann_json
"

src_unpack() {
	git-r3_src_unpack
	pushd "${S}"/uranus || die
	export GOPROXY="https://goproxy.cn,direct"
	go mod tidy || die
	go mod vendor || die
	popd || die
}

src_compile(){
	make gentoo-build
}

src_install(){
	DRIVER_VERSION=$(grep -Po '(?<=^PACKAGE_VERSION=")(.*)(?="$)' hackernel/kernel-space/dkms.conf)
	insinto /usr/src/hackernel-${DRIVER_VERSION}
	doins -r hackernel/kernel-space/*
	dobin hackernel/user-space/build/hackernel
	dobin uranus/cmd/sample/uranus-sample
	dobin uranus/cmd/telegram/uranus-telegram
	dobin uranus/cmd/web/uranus-web
	insinto /etc/hackernel
	doins uranus/configs/telegram.yaml
	doins uranus/configs/web.yaml
	insinto /etc/modules-load.d
	doins hackernel/scripts/modules-load/hackernel.conf
	insinto /usr/lib/systemd/system
	doins hackernel/scripts/systemd/hackernel.service
	doins uranus/init/uranus-telegram.service
	doins uranus/init/uranus-web.service
}
