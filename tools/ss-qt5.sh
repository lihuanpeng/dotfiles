#!/usr/bin/env bash

# help functions
msg() {
    printf '%b\n' "$1" >&2
}

success() {
    msg "\33[32m[✔]\33[0m ${1}${2}"
}

error() {
    msg "\33[31m[✘]\33[0m ${1}${2}"
    exit 1
}

# env
export QT_SELECT="Qt5.12.0"
export QTDIR="/opt/Qt5.12.0/5.12.0/gcc_64"
export PATH="${QTDIR}/bin:${PATH}"
export LD_LIBRARY_PATH="${LD_LIBRARY_PATH}:${QTDIR}/lib"

/usr/local/bin/ss-qt5
