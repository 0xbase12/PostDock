#!/usr/bin/env bash

set -e

cp -f /ssh/keys/* /var/lib/postgresql/.ssh/ || echo 'No pre-populated ssh keys!'
chown -R postgres:postgres /var/lib/postgresql/

if [[ "$SSH_ENABLE" == "1" ]]; then
    echo '>>> TUNING UP SSH CLIENT...'
    if [ ! -f "/var/lib/postgresql/.ssh/id_rsa.pub" ] && [ ! -f "/var/lib/postgresql/.ssh/id_rsa" ]; then
        echo ">>>  There are no ssh keys - SSH daemon can not be enabled!"
        exit 1
    fi

    chmod 600 -R /var/lib/postgresql/.ssh/id_rsa

    mkdir -p /var/run/sshd && sed -i 's/PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config
    sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd
    echo "export VISIBLE=now" >> /etc/profile

    cat /var/lib/postgresql/.ssh/id_rsa.pub >> /var/lib/postgresql/.ssh/authorized_keys

    echo '>>> STARTING SSH SERVER...'
    /usr/sbin/sshd 2>&1
else
    echo ">>> SSH is not enabled!"
fi
