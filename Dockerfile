FROM nerzhul/archlinux

COPY makepkg.patch /tmp/makepkg.patch
RUN pacman -Sy --noconfirm binutils fakeroot file gawk gcc git make patch pkgconf \
  && patch /usr/bin/makepkg /tmp/makepkg.patch \
  && rm -rf /tmp/* /var/cache/* /var/lib/pacman/sync /usr/share/man /usr/share/locale

##############

FROM scratch
COPY --from=0 / /
