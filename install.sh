#!/usr/bin/env bash

set -ue

os_type="$(uname -s)"
current_dir=$(dirname "${BASH_SOURCE[0]:-$0}")
source $current_dir/install-scripts/utils.sh

#--------------------------------------------------------------#
#           Functions                                          #
#--------------------------------------------------------------#

function helpmsg() {
  # print_default "Usage: ${BASH_SOURCE[0]:-$0} [install | update | link] [--with-gui] [--help | -h]" 0>&2
  print_default "Usage: ${BASH_SOURCE[0]:-$0} [install] [--help | -h]" 0>&2
  print_default "  install: add require package install and symbolic link to $HOME from dotfiles [default]"
  print_default "  update: add require package install or update."
  print_default "  link: only symbolic link to $HOME from dotfiles."
  print_default ""
}

function install_brew() {
    if ! [ -x "$(command -v brew)" ]; then
        print_info "brew does not exist"
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"1
        eval "$(/opt/homebrew/bin/brew shellenv)"
    fi

    read -p "Install Homebrew packages? (y/n) " -n 1
    echo ""
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        brew bundle --file "${current_dir}/Brewfile"
    fi
}


#--------------------------------------------------------------#
#           Git                                                #
#--------------------------------------------------------------#

function setup_git() {
    git config --global include.path "$HOME/.config/git/gitconfig_shared"
    git config --global core.excludesfile "$HOME/.config/git/gitignore_global"
}

#--------------------------------------------------------------#
#           Installer                                          #
#--------------------------------------------------------------#

function update_osx_bash() {
    chsh -s /usr/local/bin/bash
}

function setup_macos() {
    install_brew
    setup_git

    source $current_dir/install-scripts/install-fonts.sh

    install_languages
    # update_osx_bash

    source $current_dir/install-scripts/link-to-homedir.sh

    ! [ -x "$(command -v fzf)" ] && source $current_dir/install-scripts/install-fzf.sh
    ! [ -x "$(command -v starship)" ] && source $current_dir/install-scripts/install-starship.sh
    # ! [ -x $(command -v alacritty) ] && source $current_dir/install-scripts/install-alacritty.sh

    read -p "Install Astronvim? (y/n) " -n 1
    echo ""
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        source $current_dir/install-scripts/install-astronvim.sh
    fi
}

function install() {
    case "${os_type}" in
        Linux*)
            os_type="Linux"
            ;;
        Darwin*)
            os_type="macOS"
            setup_macos
            ;;
        *)
            os_type="Other"
            ;;
    esac
}

#--------------------------------------------------------------#
#           Main                                               #
#--------------------------------------------------------------#

function main() {
    IS_INSTALL="true"
    while [ $# -gt 0 ];do
        case ${1} in
            --debug|-d)
                set -uex
                ;;
            --help|-h)
                helpmsg
                exit 1
                ;;
            # install)
            #     IS_INSTALL="true"
            #     ;;
            *)
                ;;
        esac
        shift
    done

    if [[ "$IS_INSTALL" = true ]];then
        install
        command echo ""
        command echo "#####################################################"
        command echo -e "\033[1;36m $(basename $0) install success!!! \033[m"
        command echo "#####################################################"
        command echo ""
    fi
}

main "$@"
