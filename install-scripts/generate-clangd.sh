#!/bin/bash

set -ue

# references: https://medium.com/linux-with-michael/how-to-setup-clangd-with-gcc-headers-and-neovim-lsp-for-competitive-programming-2f3f98425ae1
# On Mac, can use brew to install GNU C++ by `brew`
# ```
# brew install llvm gcc@12
# ```
# 
# then use
# ```
# gcc-12 -E -v -xc++ /dev/null
# ```
# then search for the block of `#include <...> search starts here`
# and add those directories after `-I` in `.clangd`

# run the function directly by `bash` will substitute the env variables
# or can use `envsubst` to substitute env variables
function generate_clangd() {
cat << EOF > $HOME/.clangd 
CompileFlags:
Add:
- -DLOCAL
- -Wall
- -O2
- -Wextra
- -Wshadow
- -Wconversion
- -Wfloat-equal
- -Wno-unused-const-variable
- -Wno-sign-conversion
- -std=c++17
- -I${CP_HOME}/include/

Index:
  Background: Skip
EOF
}

generate_clangd
