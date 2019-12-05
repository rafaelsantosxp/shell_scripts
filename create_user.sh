#!/bin/bash
sudo adduser -d /home/ansadm -m ansadm
echo "ansadm:anspasswd" | chpasswd
chage -E -1 ansadm
chattr -i /etc/sudoers
echo "ansadm  ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers
chattr +i /etc/sudoers
