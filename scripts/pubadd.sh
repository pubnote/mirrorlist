#!/bin/bash -e
set -o pipefail
# pubadd <url>…: adds a pubnotes directory for the given resource's hash
for url in ${*}; do
    SHA256=$(curl -fsSL -o - "${url}" | sha256sum | cut -f 1 -d ' ')
    DIR=$(echo "${SHA256}" | sed -r 's/(.{2})/\1\//g')
    #echo DIR: ${DIR}
    mkdir -p "${DIR}"
    echo "${url}" >> "${DIR}"/mirrorlist
done

