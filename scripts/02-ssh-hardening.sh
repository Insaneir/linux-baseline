#!/bin/bash
SSHD="/etc/ssh/sshd_config"

sed -i 's/^#*PermitRootLogin.*/PermitRootLogin no/' $SSHD
sed -i 's/^#*PasswordAuthentication.*/PasswordAuthentication no/' $SSHD

systemctl restart ssh
