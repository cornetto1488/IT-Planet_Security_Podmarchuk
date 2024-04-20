#!/bin/bash

REMOTE_HOST="192.168.1.5"
REMOTE_USER="admin"
REMOTE_FILE="/var/log/suricata/suricata_em028826/alerts.log"
LOCAL_DIR="/var/log/rsys/"
LOCAL_FILE="alerts.txt"
SFTP_COMMANDS="/tmp/sftp_commands"
PASS="qwerty"

echo "get $REMOTE_FILE $LOCAL_DIR$LOCAL_FILE" > $SFTP_COMMANDS

export SSHPASS="$PASS"
sshpass -e sftp -oBatchMode=no -b - $REMOTE_USER@$REMOTE_HOST << EOF
get $REMOTE_FILE $LOCAL_DIR$LOCAL_FILE
bye

EOF

rm $SFTP_COMMANDS
