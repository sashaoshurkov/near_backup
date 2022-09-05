#!/bin/bash

DATE=$(date +%Y-%m-%d-%H-%M)
DATADIR=/root/.near/data
BACKUPDIR=/root/backup_node/near_${DATE}
LOGS=/root/.near/logs

mkdir $BACKUPDIR

systemctl stop neard

wait

echo "NEAR node was stopped" | ts

if [ -d "$BACKUPDIR" ]; then
    echo "Backup started" | ts
    cp -rf $DATADIR/ ${BACKUPDIR}/
    curl -fsS -m 10 --retry 5 -o /dev/null https://hc-ping.com/f2a8e0ea-f8ca-4315-ba14-c41a0e225fd3
    echo "Backup completed" | ts >> $LOGS/backup.log
else
    echo $BACKUPDIR is not created. Check your permissions  >> $LOGS/backup.log
    exit 0
fi

systemctl start neard

echo "NEAR node was started" | ts

tar -zcvf ${BACKUPDIR}/archive_${DATE}.tar.gz ${BACKUPDIR}/data
rm -rf ${BACKUPDIR}/data
find ${BACKUPDIR} -name "*.tar.gz" -type f -mtime +5 -delete

echo "NEAR backup clean" | ts
