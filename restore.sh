#!/bin/bash

DATADIR=/root/.near
BACKUPFILE=/root/backup_node/archive.tar.gz
LOGS=/root/.near/logs
HOST_SSH=89.163.209.173
USER_SSH=root

systemctl stop neard

rm -rf ${DATADIR}/data

scp ${USER_SSH}@${HOST_SSH}:${BACKUPFILE} /${DATADIR}

cd ${DATADIR} && tar -xpvzf archive.tar.gz

systemctl start neard

echo "NEAR node was started" | ts

rm -f ${DATADIR}/archive.tar.gz

echo "NEAR restore clean" | ts
