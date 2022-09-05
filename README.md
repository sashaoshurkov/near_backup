# backup.sh
Automatic backup script for NEAR shardnet validator.

Before use, enter the correct values for the following variables:
DATADIR=/root/.near/data # Work DB directory
BACKUPDIR=/root/backup_node/near_${DATE} # Backup directory
LOGS=/root/.near/logs # Log directory

# restore.sh
Automatic recovery script for NEAR shardnet validator

Before use, enter the correct values for the following variables:
DATADIR=/root/.near # Work DB directory
BACKUPFILE=/root/backup_node/archive.tar.gz # Backup archive file
LOGS=/root/.near/logs # Log directory
HOST_SSH=89.163.209.173 # Backup host
USER_SSH=root # User from backup host
