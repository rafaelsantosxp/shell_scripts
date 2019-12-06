#!/bin/bash
USERNAME=ansadm
PASSWORD=anspasswd
HOSTS="
host1
host2
host3
"
SCRIPT="hostname; pwd"
for HOSTNAME in ${HOSTS} ; do
    sshpass -p ${PASSWORD} ssh -o StrictHostKeyChecking=no -l ${USERNAME} ${HOSTNAME} "${SCRIPT}"
done
