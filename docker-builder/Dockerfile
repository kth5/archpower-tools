FROM kth5/archpower:latest 
MAINTAINER Alexander Baldeck <alex.bldck@gmail.com>

RUN pacman -Sy --noconfirm base-devel
RUN pacman --noconfirm -Scc && rm -rf /var/lib/pacman/base
RUN groupadd -g 1000 builder
RUN useradd -m -G wheel -u 1000 -g 1000 -c "Arch Builder" builder
RUN sed 's@# %wheel ALL=(ALL) NOPASSWD: ALL@%wheel ALL=(ALL) NOPASSWD: ALL@g' -i /etc/sudoers
