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
    sshpass -p ${PASSWORD} ssh-copy-id -i ~/.ssh/id_rsa.pub ${HOSTNAME}
done
