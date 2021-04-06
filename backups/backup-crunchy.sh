#!/bin/bash
# shellcheck disable=SC2086
# Backup Cron Job to rsync files to and from NAS

RSYNC_BIN=/usr/bin/rsync
BACKUP_DIR=/mnt/newnas/crunchy
RSYNC_OPTIONS="-v --progress -a --recursive --delete-before --times --perms --owner --group --update --checksum --links --compress --protect-args"

if [ -d ${BACKUP_DIR} ]; then
        ${RSYNC_BIN} ${RSYNC_OPTIONS} /mnt/Storage/Backup/crunchy/ ${BACKUP_DIR}
fi

