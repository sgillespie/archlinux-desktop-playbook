#!/bin/bash

set -e

gpg --recv-keys --keyserver hkp://pgp.mit.edu 1EB2638FF56C0C53

for pkg in cower pacaur; do
    cd /tmp
    curl "https://aur.archlinux.org/cgit/aur.git/snapshot/${pkg}.tar.gz" -o "/tmp/${pkg}.tar.gz"
    tar xzf "${pkg}.tar.gz"
    cd "${pkg}"
    makepkg --syncdeps --install --noconfirm
done
