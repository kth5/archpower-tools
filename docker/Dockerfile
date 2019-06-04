FROM scratch
MAINTAINER Alexander Baldeck <alex.bldck@gmail.com>

COPY ./sysroot/ .

RUN pacman --noconfirm -Scc && rm -rf /var/lib/pacman/base
RUN source /etc/profile && \
    sed 's@#en_US.UTF-8 UTF-8@en_US.UTF-8 UTF-8@g' -i /etc/locale.gen && \
    locale-gen && \
    echo 'LANG=en_US.UTF-8' > /etc/locale.conf 
