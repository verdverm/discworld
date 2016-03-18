#!/bin/bash

REL_PATH=`echo $APPDIR | sed 's|'$EXTERNAL_GOPATH'/src/||'`
GOAPP_PATH="/go/src/$REL_PATH"

echo
echo $REL_PATH
echo $GOAPP_PATH
echo 
ls $APPDIR
echo
echo


printf "Dockerizing $REL_PATH\n------------------------\n"


mkdir -p $GOAPP_PATH
cp -r $APPDIR/* $GOAPP_PATH
cd $GOAPP_PATH
ls
echo
echo 

echo " - Building Golang static binary"
CGO_ENABLED=0 go build -a -ldflags '-s' .

echo " - Building minimal Docker image"
docker build --no-cache -t $1 .
