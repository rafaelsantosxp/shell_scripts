#!/bin/bash
USERNAME=ansadm
PASSWORD=anspasswd
HOSTS="
host1
host2
host3
"
SCRIPT="
sudo adduser -d /home/ansadm -m ansadm;
sudo echo "ansadm:anspasswd" | chpasswd;
sudo chage -E -1 ansadm;
sudo chattr -i /etc/sudoers;
sudo echo "ansadm  ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers;
sudo chattr +i /etc/sudoers;
"
for HOSTNAME in ${HOSTS} ; do
    sshpass -p ${PASSWORD} ssh -o StrictHostKeyChecking=no -l ${USERNAME} ${HOSTNAME} "${SCRIPT}"
done
