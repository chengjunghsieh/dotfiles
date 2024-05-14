# -----------
# General Use
# -----------
alias ls='exa'                                                         # ls
alias lS='exa -1'                                                      # one column, just names
alias l='exa -lbF --git'                                               # list, size, type, git
alias ll='exa -lbaF --git'                                             # long list
alias llm='exa -lbGd --git --sort=modified'                            # long list, modified date sort
alias la='exa -lbhHigUmuSa --time-style=long-iso --git --color-scale'  # all list
alias lx='exa -lbhHigUmuSa@ --time-style=long-iso --git --color-scale' # all + extended list


# -----------------
# --paging=never  # without `less`
# -p/--plain      # print without linen number
#  bat main.cpp | xclip
# -n              # line number only
# -----------------
alias cat='bat -p --paging=never'
alias cls='clear'
alias cp='cp -i'
alias dir='ls -lg|more'
alias grep='egrep --color=auto'
alias mv='mv -i'
alias rm='rm -i'

alias vi='vim'
alias lzvim="NVIM_APPNAME=lazyvim nvim"
