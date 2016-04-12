#!/bin/bash


printf "Dockerizing Python3 project\n------------------------\n"


# cp -r $APPDIR/* /pycode
# cd /pycode
# ls
# echo
# echo 

printf " - Building minimal Docker image\n"
cd $APPDIR
docker build --no-cache -t $@ .
