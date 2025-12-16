#!/bin/bash
set -e

SSHD="/etc/ssh/sshd_config"
BACKUP="/etc/ssh/sshd_config.bak"

# Backup ก่อนเสมอ
[ ! -f "$BACKUP" ] && cp $SSHD $BACKUP

apply() {
  key="$1"
  value="$2"

  if grep -q "^$key" "$SSHD"; then
    sed -i "s/^$key.*/$key $value/" "$SSHD"
  else
    echo "$key $value" >> "$SSHD"
  fi
}

apply PermitRootLogin no
apply X11Forwarding no
apply ClientAliveInterval 300
apply ClientAliveCountMax 2

# ตรวจ config ก่อน restart (สำคัญมาก)
sshd -t

systemctl restart ssh
