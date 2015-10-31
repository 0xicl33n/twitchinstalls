#!/bin/bash
#python milestone
echo "print('hello,world!')" >> ~/hello.py
python ~/hello.py
sleep 15
#
#install packages
REV="192.241.210.124"
FILE="/tmp/out.$$"
GREP="/bin/grep"
# Make sure only root can run this
if [ "$(id -u)" != "0" ]; then
   echo "This script must be run as root" 1>&2
      exit 1
      fi

pacman -Syuu
pacman -S --noconfirm base-devel zsh screen nmap openssh i3-wm xorg-core vba python2-minimal irssi i3status dmenu

#ssh tunnel
ssh -f -N -T -R22222:localhost:22 twitchbox@twitchinstalls.randomvariable.co.uk &

