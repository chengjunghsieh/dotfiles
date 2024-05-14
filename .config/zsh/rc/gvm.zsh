#!/usr/bin/env zsh

export GO111MODULE=on
# set mirroring, if you need to
export GOPROXY=https://goproxy.io,direct
# or `export GOPROXY="https://goproxy.cn"`
export GOPATH="$HOME/code/go"
PATH="$GOPATH/bin:$PATH"
# you can set as your own mirror
# export GO_BINARY_BASE_URL=https://golang.google.cn/dl/
[[ -s "$HOME/.gvm/scripts/gvm" ]] && source "$HOME/.gvm/scripts/gvm"
export GOROOT_BOOTSTRAP=$GOROOT
