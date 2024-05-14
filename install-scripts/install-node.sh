#!/usr/bin/env bash

function install_node_version {
    nvm install 14
    nvm use 14
}

function install_nvm {
    export NVM_DIR="${HOME}/.nvm"
    mkdir -p "${NVM_DIR}"
    tag=$(curl -s https://api.github.com/repos/nvm-sh/nvm/releases/latest \
        | grep "tag_name" \
        | cut -d : -f 2 \
        | tr -d \ ,\")

    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/$(tag)/install.sh | bash 
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

}

function install_node {
    install_nvm
    install_node_version
}

install_node
