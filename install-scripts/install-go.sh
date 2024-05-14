#/bin/bash

function install_go_version {
	gvm install go1.20 -B
	gvm use go1.20 --default
}


function install_go {
	curl -sSL https://github.com/soulteary/gvm/raw/master/binscripts/gvm-installer | zsh
	source /Users/unolight/.gvm/scripts/gvm
	install_go_version
}

install_go
