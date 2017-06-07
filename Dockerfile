FROM base/archlinux

RUN pacman -Syyu -q --noconfirm
RUN pacman -S chromium -q --noconfirm
RUN pacman -S socat -q --noconfirm
RUN pacman -S xorg-server-xvfb -q --noconfirm
RUN pacman -Sc --noconfirm

RUN useradd -m chromium

USER chromium
WORKDIR /home/chromium

COPY start.sh /home/chromium/

ENV DISPLAY :1.0

ENTRYPOINT ["sh", "/home/chromium/start.sh"]

