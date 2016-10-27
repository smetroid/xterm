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
export PS1="\u@\h \[\033[32m\]\w\[\033[33m\]\$(parse_git_branch)\[\033[00m\] $ "

alias vim='vimx'

#export KERN_DIR=/usr/src/kernels/4.0.4-301.fc22.x86_64
export GOROOT=/usr/local/go
export GOPATH=/home/ecarranco/projects/go
export PATH=$PATH:/usr/local/go/bin:/home/ecarranco/projects/go/bin

