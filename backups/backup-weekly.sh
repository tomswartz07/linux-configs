#!/bin/bash
# shellcheck disable=SC2086
# Backup Cron Job to rsync files to and from NAS

RSYNC_BIN=/usr/bin/rsync
RSYNC_OPTIONS="-v --recursive -a --delete --times --perms --owner --group --update --checksum --links --compress --protect-args"
BACKUP_DIR=/mnt/newnas/home/magrathea

if [ -d ${BACKUP_DIR} ]; then
        # Documents
        ${RSYNC_BIN} ${RSYNC_OPTIONS} /home/tom/Android ${BACKUP_DIR}
        ${RSYNC_BIN} ${RSYNC_OPTIONS} /home/tom/Arduino ${BACKUP_DIR}
        ${RSYNC_BIN} ${RSYNC_OPTIONS} /home/tom/Documents ${BACKUP_DIR}
        ${RSYNC_BIN} ${RSYNC_OPTIONS} /home/tom/KiCAD ${BACKUP_DIR}
        # Archive Files
        ${RSYNC_BIN} ${RSYNC_OPTIONS} /mnt/Storage/Backup/pgdumps ${BACKUP_DIR}/pgdumps
        ${RSYNC_BIN} ${RSYNC_OPTIONS} /home/tom/wxtoimg ${BACKUP_DIR}
fi
