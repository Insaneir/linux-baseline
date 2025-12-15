#!/bin/bash
cat >>/etc/sysctl.conf <<EOF
net.ipv4.tcp_syncookies=1
EOF
sysctl -p
