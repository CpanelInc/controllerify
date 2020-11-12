all:
	${MAKE} clean
	${MAKE} controllerify

clean:
	/bin/rm -f controllerify

controllerifyd/VERSION:
	echo INSTALLER_VERSION=development-`git describe --tags --abbrev=0` > controllerifyd/VERSION
	echo REVISION=`git log -1 --pretty='format:%H'` >> controllerifyd/VERSION

controllerify: utils/*
	perl -cw -Mstrict controllerifyd/bootstrap
	utils/makeself controllerifyd controllerify 'cPanel & WHM controllerifyer' './bootstrap'

test:
	/usr/local/cpanel/3rdparty/bin/prove -w t/*.t
