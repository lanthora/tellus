default:
	@scripts/init.sh
	@scripts/build.sh
	@scripts/hello.sh

init:
	@scripts/init.sh

build:
	@scripts/build.sh

install:
	@scripts/install.sh

remove:
	@scripts/remove.sh

dev:
	@scripts/dev.sh
