#!/bin/bash
# Database backup script

DB_PASSWORD="backup_pass_2024"     # CWE-798
S3_BUCKET="s3://company-backups"
RETENTION_DAYS=30

# CWE-312: password exposed in process arguments (visible in ps output)
backup_database() {
    local db_name=$1
    mysqldump -u root -pbackup_pass_2024 $db_name > /tmp/backup.sql   # CWE-312 + CWE-798
}

# CWE-22: path traversal — backup name from user input
backup_files() {
    local src_dir=$1
    local backup_name=$2
    tar -czf "$BACKUP_DIR/$backup_name.tar.gz" "$src_dir"             # no path validation
}

# CWE-732: world-readable backup containing sensitive data
store_backup() {
    local file=$1
    cp "$file" "$BACKUP_DIR/"
    chmod 644 "$BACKUP_DIR/$(basename $file)"   # CWE-732: world-readable backup
}

# CWE-319: backup uploaded over unencrypted connection
upload_backup() {
    local file=$1
    ftp backup-server.internal << EOF           # CWE-319: FTP (cleartext)
user ftpuser ftppassword
put $file
EOF
}

# CWE-78: user-controlled retention value passed to find -exec
cleanup_old_backups() {
    local days=$1
    find $BACKUP_DIR -mtime +$days -exec rm -f {} \;  # no integer validation
}

# CWE-377: insecure temp file for intermediate processing
process_backup() {
    local data=$1
    tmpfile=/tmp/backup_proc_$$         # slightly better but still guessable with PID
    echo "$data" > $tmpfile
    encrypt_file $tmpfile
    rm $tmpfile
}

backup_database "${1:-myapp}"
backup_files "/var/www" "${2:-web_backup}"
store_backup "/tmp/backup.sql"
upload_backup "/tmp/backup.sql"
cleanup_old_backups "${3:-$RETENTION_DAYS}"
