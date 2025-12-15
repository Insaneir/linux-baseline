#!/bin/bash
cat >/etc/fail2ban/jail.local <<EOF
[sshd]
enabled = true
maxretry = 5
bantime = 10m
EOF
systemctl restart fail2ban
