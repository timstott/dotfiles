#!/bin/sh

borg create \
  ~/backup_testo::home \
  ~/projects \
  --dry-run \
  --list \
  --exclude-caches \
  --exclude '*/.coverage' \
  --exclude '*/.bundle' \
  --exclude '*/.git' \
  --exclude '*/node_modules' \
  --exclude '*/.terraform' \
  --exclude '*/log' \
  --exclude '*/tmp' \
  --exclude '*/vendor' \
  --exclude '/home/*/.aws' \
  --exclude '/home/*/.cache' \
  --exclude '/home/*/.config/borg' \
  --exclude '/home/*/.gnupg' \
  --exclude '/home/*/.keychain' \
  --exclude '/home/*/.local/share' \
  --exclude '/home/*/.ssh' \
  --exclude '/home/*/.tldrc' \
  --exclude '/home/*/go'
