#!/bin/bash

DEFAULT_NETWORK_INTERFACE=$(ip route | grep '^default' | awk '{print $5}' | head -n1)
DEFAULT_WIRELESS_INTERFACE=$(iw dev | grep -A 1 "phy#0" | grep Interface | cut -d " " -f 2)

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch Polybar, using default config location ~/.config/polybar/config
polybar example >/dev/null & disown # Tee into logfile if needed
#polybar leftbar >/dev/null & disown # Tee into logfile if needed
#polybar midbar >/dev/null & disown # Tee into logfile if needed
#polybar rightbar >/dev/null & disown # Tee into logfile if needed

echo "Polybar launched..."
