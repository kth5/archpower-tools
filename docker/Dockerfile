FROM scratch
MAINTAINER Alexander Baldeck <alex.bldck@gmail.com>

COPY ./sysroot/ .

RUN pacman --noconfirm -Scc && rm -rf /var/lib/pacman/base
