#!/bin/zsh


function both() {
	/usr/bin/xrandr --output DP-1 --mode 1920x1080 --pos 1920x0 --rotate right --output HDMI-1-0 --primary --mode 1920x1080 --pos 0x0 --output eDP-1 --off 
	# Fallback in case size not recognised
	/usr/bin/xrandr --output DP-1 --auto --pos 1920x0 --output HDMI-1-0 --primary --auto --pos 0x0 --output eDP-1 --off
}

function upright() {
	/usr/bin/xrandr --output DP-1 --mode 1920x1080 --pos 0x0 --primary --rotate right  --output HDMI-1-0 --off --output eDP-1 --off
	# Fallback in case explicit size not recognised
	/usr/bin/xrandr --output DP-1 --auto --pos 0x0 --primary --rotate right  --output HDMI-1-0 --off --output eDP-1 --off
}

function laptop() {
	/usr/bin/xrandr --output DP-1 --off --output HDMI-1-0 --off  
	/usr/bin/xrandr --output eDP-1 --auto --primary 
	/usr/bin/xrandr --output eDP1 --auto --primary

}

function main() {
	/usr/bin/xrandr --output DP-1 --off --output HDMI-1-0 --mode 1920x1080 --primary --pos 0x0 --output eDP-1 --off
	# Fallback in case explicit size not recognised
	/usr/bin/xrandr --output DP-1 --off --output HDMI-1-0 --auto --primary --pos 0x0 --output eDP-1 --off
}

function VM() {
	/usr/bin/xrandr --output Virtual-1 --auto 
	/usr/bin/xrandr --output Virtual1 --auto
}

while getopts lmub option; do
	case "${option}" in
		l) laptop;;
		m) main;;
		u) upright;;
		b) both;;
		v) VM;;
	esac
done
