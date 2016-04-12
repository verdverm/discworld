#!/bin/bash

set -e 

nocache="--no-cache"


# BUILD base docker
# docker build $nocache -t discworld/alpine          alpine

# BUILD golang
docker build $nocache -t discworld/golang          golang

# BUILD python
# docker build $nocache -t discworld/python2         python2
docker build $nocache -t discworld/python3         python3


