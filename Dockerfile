
FROM base/devel:latest

RUN echo -e '\n[tda]\nSigLevel = Never\nServer = https://repo.tda.tamedia.ch' >> /etc/pacman.conf

RUN echo -e 'Server = http://mirror.metalgamer.eu/archlinux/$repo/os/$arch' >> /etc/pacman.d/mirrorlist
RUN pacman -Sy --noconfirm archlinux-keyring
RUN pacman-key --init && pacman-key --populate archlinux && pacman-key --refresh-keys

RUN pacman --noconfirm -Syy
RUN pacman -S --needed --needed  --noconfirm openssl openssl-1.0
RUN pacman -S --noconfirm --needed  flex bison git wget
#RUN pacman -S --noconfirm --needed  libpqxx postgresql #needed?

RUN useradd builduser ; echo "builduser ALL = (root) NOPASSWD:ALL" >> /etc/sudoers.d/builduser
RUN mkdir /tmp/install
WORKDIR /tmp/install
ADD zmq.sh /tmp/install
RUN bash ./zmq.sh

ADD pipeline.sh /tmp/install
RUN chown builduser -R /tmp/install
RUN su -c "bash ./pipeline.sh" -s /bin/bash builduser

 