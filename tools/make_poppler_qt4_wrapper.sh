#!/usr/bin/env bash

# export dependes
export QTDIR="/usr/local/Qt-4.8.5"

export POPPLER_QT4_CFLAGS=-I$QTDIR/include
export POPPLER_QT4_CXXFLAGS=-I$QTDIR/include
export POPPLER_QT4_LIBS="-L$QTDIR/lib -lQtCore -lQtGui -lQtXml"
export POPPLER_QT4_TEST_CFLAGS=-I$QTDIR/include
export POPPLER_QT4_TEST_LIBS="-L$QTDIR/lib -lQtCore -lQtGui -lQtXml"

# configure and make
./configure --enable-poppler-qt4
make -j4
sudo make install
