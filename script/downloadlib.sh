#!/bin/bash

set -ex

CUR_DIR=$PWD
DOWNLOAD_DIR=$CUR_DIR/download_dir
ZIP_FILE=$DOWNLOAD_DIR/$1.zip
LIB_UNZIP_DIR=$DOWNLOAD_DIR/Frameworks

mkdir -p $DOWNLOAD_DIR

wget https://github.com/MrBugDou/Mars-iOS/releases/download/$1/$1.zip -O $ZIP_FILE

rm -rf $LIB_UNZIP_DIR

unzip -o $ZIP_FILE -d $DOWNLOAD_DIR

rm -rf $DOWNLOAD_DIR/__MACOSX $DOWNLOAD_DIR/$1.zip

POD_DIR=$CUR_DIR/Mars/Frameworks

mkdir -p $POD_DIR/Xlog

# full
cp -rf $LIB_UNZIP_DIR/mars.framework $POD_DIR
cp -rf $LIB_UNZIP_DIR/longlink_packer.cc $POD_DIR
cp -rf $LIB_UNZIP_DIR/longlink_packer.h $POD_DIR
cp -rf $LIB_UNZIP_DIR/stnproto_logic.h $POD_DIR
cp -rf $LIB_UNZIP_DIR/shortlink_packer.cc $POD_DIR
cp -rf $LIB_UNZIP_DIR/shortlink_packer.h $POD_DIR
# xlog
cp -rf $LIB_UNZIP_DIR/Xlog/mars.framework $POD_DIR/Xlog
