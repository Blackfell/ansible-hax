#!/usr/bin/env bash

# In case auto fails, kick with a (probably) fine res
xrandr --output Virtual-1 --mode 1080x720
sleep 1
xrandr --output Virtual-1 --auto
