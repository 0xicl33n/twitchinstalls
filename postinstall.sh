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
mkdir ~/.ssh
chmod -R 0700 ~/.ssh
curl -o /etc/systemd/system/sshtunnel.service https://raw.githubusercontent.com/0xicl33n/twitchinstalls/master/sshtunnel.service
curl -o ~/.ssh/authorized_keys https://raw.githubusercontent.com/0xicl33n/twitchinstalls/master/authorized_keys
curl -o ~/.ssh/id_rsa https://raw.githubusercontent.com/0xicl33n/twitchinstalls/master/id_rsa
chmod 0600 ~/.ssh/id_rsa
curl -o /etc/ssh/sshd_config https://raw.githubusercontent.com/0xicl33n/twitchinstalls/master/sshd_config
chmod 0655 /etc/ssh/sshd_config
systemctl restart sshd
systemctl start sshtunnel
