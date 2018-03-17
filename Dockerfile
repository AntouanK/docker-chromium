FROM base/archlinux

RUN pacman -Syyu -q --noconfirm
RUN pacman -S chromium -q --noconfirm
RUN pacman -S socat -q --noconfirm
RUN pacman -S xorg-server-xvfb -q --noconfirm
RUN pacman -Sc --noconfirm
RUN rm -rf /tmp/*

# Add chromium user
RUN groupadd -r chromium && useradd -r -g chromium -G audio,video chromium \
    && mkdir -p /home/chromium/Downloads && chown -R chromium:chromium /home/chromium

WORKDIR /home

ENV DISPLAY :1.0
# Run as non privileged user
USER chromium
COPY start.sh ~/start.sh

ENTRYPOINT ["sh", "~/start.sh"]
