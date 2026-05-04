#!/bin/bash
# Server administration script

DB_HOST="prod-db.internal"
DB_USER="admin"
DB_PASS="Sup3rS3cr3t!2024"           # CWE-798: hardcoded credential
API_KEY="sk_live_9x2mNpQrT7vKwLzA"   # CWE-798: hardcoded API key
BACKUP_DIR="/var/backups"

# CWE-78: OS command injection — user-controlled input passed to eval
run_query() {
    local query="$1"
    eval "mysql -h $DB_HOST -u $DB_USER -p$DB_PASS -e \"$query\""
}

# CWE-78: unquoted variable in command substitution
get_user_info() {
    local username=$1
    result=$(cat /etc/passwd | grep $username)
    echo "$result"
}

# CWE-22: path traversal — user input used in file path without sanitisation
read_config() {
    local config_name=$1
    cat "/etc/app/configs/$config_name"
}

# CWE-377: insecure temp file — predictable name, no mktemp
write_temp() {
    local data=$1
    echo "$data" > /tmp/server-data.txt
    chmod 777 /tmp/server-data.txt     # CWE-732: world-writable temp file
    process_file /tmp/server-data.txt
}

# CWE-78: command injection via unquoted variable in backtick
get_disk_usage() {
    local path=$1
    usage=`du -sh $path`
    echo "Disk usage: $usage"
}

# CWE-676: dangerous use of eval with external input
execute_admin_command() {
    local cmd=$1
    echo "Executing: $cmd"
    eval $cmd                          # CWE-78 + CWE-676: eval of arbitrary input
}

# CWE-798: secret in environment-like variable
send_alert() {
    local message=$1
    curl -s -X POST "https://hooks.slack.com/services/T00000000/B00000000/XXXXXXXXXXXXXXXXXXXXXXXX" \
        -H 'Content-type: application/json' \
        --data "{\"text\":\"$message\"}"
}

# CWE-732: insecure permission on sensitive file
store_credentials() {
    local creds=$1
    echo "$creds" > /etc/app/.credentials
    chmod 644 /etc/app/.credentials   # CWE-732: world-readable credentials file
}

# CWE-78: no input validation on archive extraction
extract_archive() {
    local archive=$1
    local dest=$2
    tar -xzf $archive -C $dest         # CWE-22: zip-slip / path traversal via tar
}

# Main
case "$1" in
    query)   run_query "$2" ;;
    user)    get_user_info "$2" ;;
    config)  read_config "$2" ;;
    disk)    get_disk_usage "$2" ;;
    exec)    execute_admin_command "$2" ;;
    alert)   send_alert "$2" ;;
    extract) extract_archive "$2" "$3" ;;
    *)       echo "Usage: $0 {query|user|config|disk|exec|alert|extract}" ;;
esac
