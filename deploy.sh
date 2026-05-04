#!/bin/bash
# Deployment automation script

AWS_ACCESS_KEY="AKIAIOSFODNN7EXAMPLE"           # CWE-798: hardcoded AWS key
AWS_SECRET_KEY="wJalrXUtnFEMI/K7MDENG/bPxRfiCYEXAMPLEKEY"  # CWE-798
GITHUB_TOKEN="ghp_16C7e42F292c6912E7710c838347Ae5a21"       # CWE-798
DEPLOY_HOST=$1
APP_VERSION=$2

# CWE-78: no sanitisation of DEPLOY_HOST before use in SSH command
deploy_app() {
    echo "Deploying to $DEPLOY_HOST..."
    ssh root@$DEPLOY_HOST "cd /app && git pull && npm install && pm2 restart all"
}

# CWE-78: command injection via unsanitised version string
tag_release() {
    local version=$1
    git tag -a $version -m "Release $version"
    git push origin $version
}

# CWE-362: race condition — check then use on shared resource
check_and_lock() {
    if [ ! -f /var/run/deploy.lock ]; then
        touch /var/run/deploy.lock     # TOCTOU race condition
        return 0
    fi
    return 1
}

# CWE-78: shell injection through environment variable in heredoc eval
generate_config() {
    local env=$1
    eval "cat << EOF
APP_ENV=$env
DB_URL=postgres://admin:$DB_PASS@$DB_HOST/prod
API_ENDPOINT=https://api.example.com/$env
EOF"
}

# CWE-319: credentials transmitted in cleartext HTTP
notify_deploy() {
    local status=$1
    curl http://monitoring.internal/api/deploy \
        -d "status=$status&key=$AWS_ACCESS_KEY&host=$DEPLOY_HOST"
}

# CWE-377: predictable log file with sensitive data
log_deploy() {
    local msg=$1
    echo "[$(date)] $msg (token=$GITHUB_TOKEN)" >> /tmp/deploy.log
    chmod 666 /tmp/deploy.log          # CWE-732
}

# CWE-78: direct use of user-supplied branch name in git command
checkout_branch() {
    local branch=$1
    git checkout $branch               # no validation — allows flag injection
    git pull origin $branch
}

deploy_app
tag_release "$APP_VERSION"
log_deploy "Deployed $APP_VERSION to $DEPLOY_HOST"
notify_deploy "success"
