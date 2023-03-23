#!/bin/bash

set -ex

CUR_DIR=$PWD
DOWNLOAD_DIR=$CUR_DIR/download_dir
ZIP_FILE=$DOWNLOAD_DIR/$1.zip
LIB_UNZIP_DIR=$DOWNLOAD_DIR/lib

mkdir -p $DOWNLOAD_DIR

wget https://github.com/MrBugDou/Mars/releases/download/$1/$1.zip -O $ZIP_FILE

unzip -o $ZIP_FILE -d $DOWNLOAD_DIR

POD_DIR=$CUR_DIR/Mars

mkdir -p $POD_DIR/Frameworks/Xlog

# full
cp -rf $LIB_UNZIP_DIR/mars.framework $POD_DIR/Frameworks
cp -rf $LIB_UNZIP_DIR/longlink_packer.cc $POD_DIR/Frameworks
cp -rf $LIB_UNZIP_DIR/longlink_packer.h $POD_DIR/Frameworks
cp -rf $LIB_UNZIP_DIR/stnproto_logic.h $POD_DIR/Frameworks
cp -rf $LIB_UNZIP_DIR/shortlink_packer.cc $POD_DIR/Frameworks
cp -rf $LIB_UNZIP_DIR/shortlink_packer.h $POD_DIR/Frameworks
# xlog
cp -rf $LIB_UNZIP_DIR/Xlog/mars.framework $POD_DIR/Frameworks/Xlog
