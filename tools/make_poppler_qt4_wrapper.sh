#!/usr/bin/env bash

function help {
    echo "Please \"export QTDIR=<Your qt4 framework path>\" first."
    echo "Usage: make_poppler_qt4_wrapper -c -m -i"
    echo "action:"
    echo "-c = ./configure --enable-poppler-qt4"
    echo "-m = make -j"
    echo "-i = make install"
    exit
}

if [ "$1" = "-c" ] && [ "$2" = "-m" ] && [ "$3" = "-i" ]; then
    if [ -f "./configure" ];then
        export POPPLER_QT4_CFLAGS=-I$QTDIR/include
        export POPPLER_QT4_CXXFLAGS=-I$QTDIR/include
        export POPPLER_QT4_LIBS="-L$QTDIR/lib -lQtCore -lQtGui -lQtXml"
        export POPPLER_QT4_TEST_CFLAGS=-I$QTDIR/include
        export POPPLER_QT4_TEST_LIBS="-L$QTDIR/lib -lQtCore -lQtGui -lQtXml"
        # configure and make
        ./configure --enable-poppler-qt4
        make -j4
        sudo make install
    else
        echo "Please run this script under \"poppler\" project dir."
        exit
    fi
else
    help
fi
