#!/bin/bash

FILE="/tmp/out.$$"
GREP="/bin/grep"
# Make sure only root can run this
if [ "$(id -u)" != "0" ]; then
   echo "This script must be run as root" 1>&2
      exit 1
      fi

pacman -Syuu
pacman -S --noconfirm base-devel zsh screen nmap openssh i3-wm xorg-core vba python2-minimal irssi i3status dmenu

