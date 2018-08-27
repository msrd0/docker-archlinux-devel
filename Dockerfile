FROM pritunl/archlinux

COPY makepkg.patch /tmp/makepkg.patch
RUN pacman -Sy --noconfirm binutils fakeroot gcc git make patch \
  && patch /usr/bin/makepkg /tmp/makepkg.patch \
  && rm -rf /tmp/* /var/cache/* /var/lib/pacman /usr/share/man /usr/share/locale \
  && mkdir -p /var/lib/pacman

##############

FROM scratch
COPY --from=0 / /
