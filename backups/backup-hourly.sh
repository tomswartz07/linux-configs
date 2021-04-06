#!/bin/bash
# shellcheck disable=SC2086
# Backup Cron Job to rsync files to and from NAS

RSYNC_BIN=/usr/bin/rsync
RSYNC_OPTIONS=(-a --recursive --delete-before --compress --exclude-from="/home/tom/git/linux-configs/backups/exclude.txt")
BACKUP_DIR=/mnt/newnas/home/magrathea

if [ -d ${BACKUP_DIR} ]; then
        ${RSYNC_BIN} "${RSYNC_OPTIONS[@]}" /home/tom/ ${BACKUP_DIR}
fi
