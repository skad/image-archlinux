NAME =			archlinux
VERSION =		latest
VERSION_ALIASES =	2014-12-02
TITLE =			Archlinux
DESCRIPTION =		Archlinux latest
SOURCE_URL =		https://github.com/scaleway/image-archlinux
VENDOR_URL =		http://archlinuxarm.org

IMAGE_VOLUME_SIZE =	50G
IMAGE_BOOTSCRIPT =	latest
IMAGE_NAME =		Archlinux


## Image tools  (https://github.com/scaleway/image-tools)
all:    docker-rules.mk
docker-rules.mk:
	wget -qO - https://j.mp/scw-builder | bash
-include docker-rules.mk
