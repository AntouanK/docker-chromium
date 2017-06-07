#!/bin/bash

chromium --version ;

mkdir .config

sleep 1;

echo "\n[start script] Starting chromium headless at $@"
chromium \
  --headless \
  --user-data-dir=/home/chromium \
  --disable-gpu \
  --no-first-run \
  --no-sandbox \
  --remote-debugging-port=9222 $@ &

sleep 1;

echo "\n[start script] Redirect incoming 9223 to 9222";
socat TCP-LISTEN:9223,fork TCP:127.0.0.1:9222
