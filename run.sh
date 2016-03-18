#!/bin/bash

REL_PATH=`echo $APPDIR | sed 's|'$EXTERNAL_GOPATH'/src/||'`

printf "Dockerizing $REL_PATH\n------------------------\n"

cd /go/src/$REL_PATH

echo " - Building Golang static binary"
CGO_ENABLED=0 go build -a -ldflags '-s' .

echo " - Building minimal Docker image"
docker build --no-cache -t $1 .
