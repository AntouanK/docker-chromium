#!/bin/bash

echo "[start script] Making virtual display";
Xvfb :1 -screen 0 1366x768x24+32 &

sleep 1;

chromium --version ;
echo "[start script] Starting chromium headless at $@"
chromium \
  --no-first-run \
  --remote-debugging-port=9222 $@ &

sleep 1;

echo "[start script] Redirect incoming 9223 to 9222";
socat TCP-LISTEN:9223,fork TCP:127.0.0.1:9222
