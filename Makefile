dev:
	@scripts/init.sh
	@scripts/build.sh
	@scripts/done.sh

init:
	@scripts/init.sh

build:
	@scripts/build.sh

install:
	@scripts/install.sh

uninstall:
	@scripts/uninstall.sh

arch-build:
	@scripts/arch-build.sh

arch-install:
	@scripts/arch-install.sh

gentoo-build:
	@scripts/gentoo-build.sh
