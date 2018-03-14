FROM base/archlinux

RUN pacman -Syyu -q --noconfirm
RUN pacman -S chromium -q --noconfirm
RUN pacman -S socat -q --noconfirm
RUN pacman -Sc --noconfirm
RUN rm -rf /tmp/*

RUN useradd -m chromium

USER chromium
WORKDIR /home/docker

COPY start.sh /home/docker/start.sh
COPY chromium /home/docker/chromium

ENTRYPOINT ["sh", "/home/docker/start.sh"]
