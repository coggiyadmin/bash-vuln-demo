#!/bin/bash
# DEMO FILE — nvm mirror index.tab command injection.
# FALSE-NEGATIVE PROBE — every block must FIRE.

MIRROR_URL="${NVM_NODEJS_ORG_MIRROR:-https://nodejs.org/dist}"

nvm_download_legacy() {
  local version
  version=$(curl -fsSL "$MIRROR_URL/index.tab" | awk -v v="$1" '$1==v {print $1}')
  eval "curl -fsSL \"$MIRROR_URL/v${version}/node-v${version}-linux-x64.tar.xz\" -o /tmp/node.tar.xz"  # CWE-78
}

nvm_get_checksum_legacy() {
  local version="$1"
  local tarball
  tarball=$(grep "^$version" "$MIRROR_CACHE/index.tab" | awk '{print $2}')
  sh -c "sha256sum /tmp/$tarball"  # CWE-78
}

install_from_mirror() {
  local requested="$1"
  local resolved
  resolved=$(curl -fsSL "$MIRROR_URL/index.tab" | grep "^$requested" | cut -f1)
  bash -c "nvm install $resolved"  # CWE-78
}
