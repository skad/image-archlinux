## -*- docker-image-name: "scaleway/archlinux:latest" -*-
FROM archlinux/base:latest

# Environment
ENV SCW_BASE_IMAGE=scaleway/archlinux:latest

ARG DOCKER_ARCH
ARG MULTIARCH_ARCH
ARG SCW_ARCH

# Override default mkinitcpio conf
COPY ./overlay/etc/mkinitcpio.conf /etc/mkinitcpio.conf

# Install packages
RUN export FLASH_KERNEL_SKIP=1; \
    pacman -Syu --noconfirm && \
    pacman -S --noconfirm \
    which \
    openssh \
    linux \
    grub

# grub-efi-$(dpkg --print-architecture | sed 's/armhf/arm/')


# Patch rootfs
# - Tweaks rootfs so it matches Scaleway infrastructure
RUN rm -f /etc/update-motd.d/10-help-text /etc/update-motd.d/00-header
COPY ./overlay-base/ ./overlay/ /


# remove root password, it will be created at first boot
RUN passwd -d root

# Configure locales
RUN locale-gen en_US.UTF-8

# Default target
RUN systemctl set-default multi-user


# Configure Systemd
# systemd utmp service is named systemd-update-utmp.service in Arch Linux
RUN systemctl preset --preset-mode=full $(cat /etc/systemd/system-preset/scw*.preset | cut -d' ' -f2 | tr '\n' ' ')

# Clean rootfs from image-builder
# remove ssh host keys so they are regenerated on first boot
# clean history
RUN rm -f /etc/ssh/*_key* && \
    rm -f /root/.history /root/.bash_history
