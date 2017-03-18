#!/usr/bin/env bash

if [ $(uname) = "Linux" ]; then
    export POPPLER_QT4_CFLAGS=-I$QTDIR/include
    export POPPLER_QT4_CXXFLAGS=-I$QTDIR/include
    export POPPLER_QT4_TEST_CFLAGS=-I$QTDIR/include
    export POPPLER_QT4_LIBS="-L$QTDIR/lib -lQtCore -lQtGui -lQtXml"
    export POPPLER_QT4_TEST_LIBS="-L$QTDIR/lib -lQtCore -lQtGui -lQtXml"
fi

if [ $(uname) = "Darwin" ]; then
    export POPPLER_QT4_CFLAGS=-I$QTDIR/include
    export POPPLER_QT4_CXXFLAGS=-I$QTDIR/include
    export POPPLER_QT4_TEST_CFLAGS=-I$QTDIR/include
    export POPPLER_QT4_LIBS="-L$QTDIR/lib -lz -framework QtCore -framework QtGui -framework QtXml"
    export POPPLER_QT4_TEST_LIBS="-L$QTDIR/lib -lz -framework QtCore -framework QtGui -framework QtXml"
fi

./configure --prefix=/Developer/Qt-4.8.6 --enable-poppler-qt4
