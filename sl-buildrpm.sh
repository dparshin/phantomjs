#!/bin/bash

SPEC=$1

VERSION=`git describe --tags --long --dirty|sed 's/\-/\./g'`

rm -rf ./rpm_build_root
mkdir -p ./rpm_build_root/SOURCES
mkdir -p ./rpm_build_root/BUILD
mkdir -p ./rpm_build_root/RPMS
mkdir -p ./rpm_build_root/SPECS
mkdir -p ./rpm_build_root/SRPMS
mkdir -p ./rpm_build_root/tmp

args=("$@")
for ((i=1; i < $#; i++)) {
   cp -r ./${args[$i]} ./rpm_build_root/SOURCES/
}

CURRENT_DIR=`pwd`
rpmbuild -bb $SPEC --buildroot=${CURRENT_DIR}/rpm_build_root/BUILD --define "_topdir $CURRENT_DIR/rpm_build_root" --define "__strip /bin/true" --define "__jar_repack 0" --define "VERSION $VERSION" || exit 1

find rpm_build_root -name "*.rpm"|xargs -I{} mv {} ./

rm -rf rpm_build_root
