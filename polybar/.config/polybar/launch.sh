#!/usr/bin/env bash

# Terminate already running bar instances
polybar-msg cmd quit

# Launch using default config location
polybar main 2>/tmp/polybar.log & disown

echo "Polybar launched..."
