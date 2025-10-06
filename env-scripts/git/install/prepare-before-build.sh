#!/bin/bash

function main {
    local version="$1"
    local os="$2"
    local path_to_docker="$3"
    local file_version_in_download_docker_context="$path_to_docker/download/with-configs/configs/versions.cfg"
    local empty_file_name="null.tar.gz"

    if [ -z "$version" ]; then
        source ./env-scripts/not-by-wrap-name/install-some-util/get-latest-version.sh
        [ $? -ne 0 ] && exit 1

        version="$(getLatestVersion "$path_to_docker" "git")"
        [ $? -ne 0 ] && exit 1
    fi

    source "./env-scripts/not-by-wrap-name/install-some-util/prepare-before-build/main.sh"
    [ $? -ne 0 ] && exit 1

    main "$version" "$os" "git" "$path_to_docker" "$empty_file_name"
    [ $? -ne 0 ] && exit 1

    exit 0
}

function formatArch {
    local arch="$1"

    echo "$arch"

    exit 0
}