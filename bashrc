# .bashrc

# User specific aliases and functions

alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

alias pushdd="pushd \$PWD > /dev/null"
alias cd='pushdd;cd'

#below to go back to a previous directory (or more)
alias popdd='popd >/dev/null'
alias cd.='popdd'
alias cd..='popdd;popdd'
alias cd...='popdd;popdd;popdd'
alias cd....='popdd;popdd;popdd;popdd'

#below to remove directories from the stack only (do not 'cd' anywhere)
alias .cd='popd -n +0'
alias ..cd='popd -n +0;popd -n +0;popd -n +0;popd -n +0;popd -n +0;popd -n +0;popd -n +0;popd -n +0;popd -n +0;popd -n +0'

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi
#Cygwin specific configuration
alias ls='ls --color=auto'
LS_COLORS=$LS_COLORS:'di=0;35:' ; export LS_COLORS

# User specific environment and startup programs
parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
export PS1="\u@\h \[\033[31m\]\w\[\033[33m\]\$(parse_git_branch)\[\033[00m\] $ "

command_exists(){
  type "$1" &> /dev/null ;
}

# if vimx available enable it
if command_exists vimx; then
  alias vim='vimx'
fi


export GOROOT=/usr/local/go
export GOPATH=~/projects/go
export PATH=$PATH:$HOME/projects/go/bin:/usr/local/go/bin

# adding xbind keys
xbindkeys -f ~/.xbindkeysrc

# alias ls -al exa -al
alias ll='exa -al'
### powerline-shell ###
function _update_ps1() {
  PS1=$(powerline-shell $?)
}

if [[ $TERM != linux && ! $PROMPT_COMMAND =~ _update_ps1 ]]; then
  PROMPT_COMMAND="_update_ps1; $PROMPT_COMMAND"
fi
### powerline-shell ###
