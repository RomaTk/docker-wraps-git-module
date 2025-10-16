#!/bin/bash

version=$1

if [[ -z "$version" ]]; then
    echo "Version argument is required."
    exit 1
fi

apt install -y \
    build-essential \
    libssl-dev \
    libcurl4-openssl-dev \
    zlib1g-dev \
    gettext \
    dh-autoreconf \
    libexpat1-dev
[ $? -ne 0 ] && exit 1

cd ./saved-versions
[ $? -ne 0 ] && exit 1

dest_folder="./git-${version}"

if [ ! -d "$dest_folder" ]; then
    mkdir -p "$dest_folder"
    [ $? -ne 0 ] && exit 1
fi

tar -xzf "${version}.tar.gz" -C "$dest_folder" --strip-components=1
[ $? -ne 0 ] && exit 1

cd "$dest_folder"
[ $? -ne 0 ] && exit 1

make configure
[ $? -ne 0 ] && exit 1
if [[ -n "${configure_options}" ]]; then
    # Split configure_options into an array
    read -r -a configure_options_array <<< "${configure_options}"
    ./configure "${configure_options_array[@]}"
else
    ./configure
fi
[ $? -ne 0 ] && exit 1
make all
[ $? -ne 0 ] && exit 1
make install
[ $? -ne 0 ] && exit 1

apt-mark auto \
    build-essential \
    libssl-dev \
    libcurl4-openssl-dev \
    zlib1g-dev \
    gettext \
    dh-autoreconf \
    libexpat1-dev
[ $? -ne 0 ] && exit 1

apt autoremove -y

exit 0