#!/usr/bin/env bash

# go one level up
cd $SRC_DIR
cd ..

# create the gopath directory structure
export GOPATH=$PWD/gopath
mkdir -p $GOPATH/src/github.com/git-lfs/git-lfs
cp -rv $SRC_DIR/* $GOPATH/src/github.com/git-lfs/git-lfs
cd $GOPATH/src/github.com/git-lfs/git-lfs

# generate the help text, see:
# https://github.com/git-lfs/git-lfs/issues/3159
# https://github.com/git-lfs/git-lfs/issues/3160
go generate github.com/git-lfs/git-lfs/commands

# build the project
go build -v

# install the binary
mkdir -p $PREFIX/bin
cp git-lfs $PREFIX/bin
