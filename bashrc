# .bashrc

# User specific aliases and functions

alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

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

