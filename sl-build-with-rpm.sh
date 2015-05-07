#!/bin/sh

echo "y"|CFLAGS=-ggdb3 CXXFLAGS=-ggdb3 ./build.sh --qt-config '-no-rpath' --qmake-args "QMAKE_CFLAGS=-ggdb3 QMAKE_CXXFLAGS=-ggdb3" || exit 1

./sl-buildrpm.sh ./sl-phantomjs-bin.spec bin
