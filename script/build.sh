#!/bin/bash

set -ex

echo "Mars Version: $1"

CUR_DIR=$PWD
WORK_DIR=$PWD/work_dir
mkdir -p $WORK_DIR

MARS_SOURCE_DIR=$WORK_DIR/mars

if [[ ! -d "$MARS_SOURCE_DIR" ]]; then
    echo "下载 Mars 源码 ...."
    git clone --single-branch --depth 1 -b $1 https://github.com/Tencent/mars.git $MARS_SOURCE_DIR
fi

cd $MARS_SOURCE_DIR/mars

OUT_DIR=$MARS_SOURCE_DIR/mars/cmake_build/iOS/iOS.out

POD_DIR=$CUR_DIR/Mars/Frameworks

mkdir -p $POD_DI/Xlog

if [[ ! -d "$POD_DIR/Xlog/mars.framework" ]]; then
    echo "编译 Mars Xlog ...."
    python -c 'import build_ios; print build_ios.build_ios_xlog()'
    cp -rf $OUT_DIR/mars.framework $POD_DIR/Xlog
fi

if [[ ! -d "$POD_DIR/mars.framework" ]]; then
    echo "编译 Mars 完整版 ...."
    python -c 'import build_ios; print build_ios.build_ios()'
    cp -rf $OUT_DIR/mars.framework $POD_DIR
    HEADER_DIR=$MARS_SOURCE_DIR/mars/libraries/mars_android_sdk/jni
    cp -rf $HEADER_DIR/longlink_packer.cc $POD_DIR
    cp -rf $HEADER_DIR/longlink_packer.h $POD_DIR
    cp -rf $HEADER_DIR/stnproto_logic.h $POD_DIR
    cp -rf $HEADER_DIR/shortlink_packer.cc $POD_DIR
    cp -rf $HEADER_DIR/shortlink_packer.h $POD_DIR
fi

cd $CUR_DIR

# exit -1
