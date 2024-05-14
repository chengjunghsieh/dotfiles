export XDG_CONFIG_HOME="${HOME}/.config"
export XDG_DATA_HOME="${XDG_DATA_HOME:-$HOME/.local/share}"
export XDG_CACHE_HOME="${XDG_CACHE_HOME:-$HOME/.cache}"

export ZDOTDIR="${XDG_CONFIG_HOME}/zsh"
export ZHOMEDIR=$HOME/.config/zsh
export ZRCDIR=$ZHOMEDIR/rc
export ZDATADIR=$XDG_DATA_HOME/zsh

export PATH="$PATH:$HOME/.local/bin"
export STARSHIP_CONFIG="${XDG_CONFIG_HOME}/starship/starship.toml"

#--------------------------------------------------------------#
#           Zim                                                #
#--------------------------------------------------------------#
# Start configuration added by Zim install {{{
#
# User configuration sourced by all invocations of the shell
#

# Define Zim location
: ${ZIM_HOME=${ZDOTDIR:-${HOME}}/.zim}
# }}} End configuration added by Zim install


#--------------------------------------------------------------#
#           Editors                                            #
#--------------------------------------------------------------#
# Add Visual Studio Code (code)
export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"
# Add Sublime Text (subl)
export PATH="$PATH:/Applications/Sublime Text.app/Contents/SharedSupport/bin"
. "$HOME/.cargo/env"
