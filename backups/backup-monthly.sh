#!/bin/bash
# shellcheck disable=SC2086
# Backup Cron Job to rsync files to and from NAS

RSYNC_BIN=/usr/bin/rsync
RSYNC_OPTIONS="-v --progress --recursive -a --times --perms --owner --group --update --checksum --links --compress --protect-args"
BACKUP_DIR=/mnt/newnas/home/magrathea
MAIL_BACKUP_DIR=/mnt/newnas/home/mail

if [ -d ${BACKUP_DIR} ]; then
        # Mail Backup
        ${RSYNC_BIN} ${RSYNC_OPTIONS} /mnt/Storage/Backup/Mail_tomswartz07 ${MAIL_BACKUP_DIR}
        ${RSYNC_BIN} ${RSYNC_OPTIONS} /mnt/Storage/Backup/Mail_tswartz ${MAIL_BACKUP_DIR}
        ${RSYNC_BIN} ${RSYNC_OPTIONS} /mnt/Storage/Backup/Mail_crunchy ${MAIL_BACKUP_DIR}
fi

if [ -d /mnt/Storage/Music ]; then
        ${RSYNC_BIN} -a -v --progress /mnt/Storage/Music/ /mnt/newnas/music
fi
