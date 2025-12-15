#!/bin/bash
set -e

REPO_RAW="https://raw.githubusercontent.com/Insaneir/linux-baseline/main"
TMP="/tmp/linux-baseline"

echo "[+] Prepare baseline"
rm -rf $TMP && mkdir -p $TMP

for f in 00-update.sh 01-packages.sh 02-ssh-hardening.sh 03-firewall.sh 04-fail2ban.sh 05-sysctl-hardening.sh
do
  curl -sL $REPO_RAW/scripts/$f -o $TMP/$f
done

chmod +x $TMP/*.sh

echo "[+] Run baseline"
sudo bash $TMP/00-update.sh
sudo bash $TMP/01-packages.sh
sudo bash $TMP/02-ssh-hardening.sh
sudo bash $TMP/03-firewall.sh
sudo bash $TMP/04-fail2ban.sh
sudo bash $TMP/05-sysctl-hardening.sh

echo "[✓] Baseline completed"
