#!/bin/bash -e
set -o pipefail
# pubadd <url>…: adds a pubnotes directory for the given resource's hash
for url in ${*}; do
    CHECKSUM=$(curl -fsSL -o - "${url}" | sha256sum | cut -f 1)
    #echo CHECKSUM: ${CHECKSUM}
    DIR=$(echo "${CHECKSUM}" | sed -r 's/(.{8})/\1\//g')
    #echo DIR: ${DIR}
    mkdir -p "${DIR}"
    echo "${URL}" >> "${DIR}"/mirrorlist
done
