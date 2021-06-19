# .bashrc

# User specific aliases and functions

alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

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
# export GOROOT=/usr/lib/golang
#export GOPATH=~/projects/go
#export PATH=$PATH:$HOME/projects/go/bin:/usr/lib/golang/bin

# adding xbind keys
xbindkeys -f ~/.xbindkeysrc

# Bash completion for kubernetes
#. /usr/local/etc/profile.d/bash_completion.sh
#source <(kubectl completion bash)


### Bash History ####
#Bash history specific
export PATH=$HOME/bin:$PATH
source <(kubectl completion bash)
# Maximum number of history lines in memory
export HISTSIZE=50000
# Maximum number of history lines on disk
export HISTFILESIZE=50000
# Ignore duplicate lines
export HISTCONTROL=ignoredups:erasedups
# When the shell exits, append to the history file
#  instead of overwriting it
shopt -s histappend

# After each command, append to the history file
#  and reread it
export PROMPT_COMMAND="${PROMPT_COMMAND:+$PROMPT_COMMAND$'\n'}history -a; history -c; history -r"
### Bash History ####

### Pet specific commands ###
function prev() {
  PREV=$(echo `history | tail -n2 | head -n1` | sed 's/[0-9]* //')
  sh -c "pet new `printf %q "$PREV"`"
}

function pet-select() {
  BUFFER=$(pet search --query "$READLINE_LINE")
  READLINE_LINE=$BUFFER
  READLINE_POINT=${#BUFFER}
}
bind -x '"\C-x\C-r": pet-select'
### Pet Specific commands ###


### v to vim ###
# fasd related
alias v='f -e vim' # quick opening files with vim
### v to vim ###
#bindkey '^X^A' fasd-complete


### exa ###
alias ll='exa -al'
### exa ###
### renaming cat to bat ###
alias cat='bat'
### renaming cat to bat ###
### fasd_entry ###
eval "$(fasd --init auto)"
### fasd_entry ###
### powerline-shell ###
function _update_ps1() {
  PS1=$(powerline-shell $?)
}

if [[ $TERM != linux && ! $PROMPT_COMMAND =~ _update_ps1 ]]; then
  PROMPT_COMMAND="_update_ps1; $PROMPT_COMMAND"
fi

# add this configuration to ~/.bashrc
#export HH_CONFIG=hicolor         # get more colors
#shopt -s histappend              # append new history items to .bash_history
#export HISTCONTROL=ignorespace   # leading space hides commands from history
#export HISTFILESIZE=10000        # increase history file size (default is 500)
#export HISTSIZE=${HISTFILESIZE}  # increase history size (default is 500)
#export PROMPT_COMMAND="history -a; history -n; ${PROMPT_COMMAND}"   # mem/file sync
# if this is interactive shell, then bind hh to Ctrl-r (for Vi mode check doc)
#if [[ $- =~ .*i.* ]]; then bind '"\C-r": "\C-a hh -- \C-j"'; fi

# fzf specific
[ -f ~/.fzf.bash ] && source ~/.fzf.bash
export FZF_CTRL_T_OPTS="--preview '(highlight -O ansi -l {} 2> /dev/null || cat {} || tree -C {}) 2> /dev/null | head -200'"

#export FZF_CTL_T_OPTS="--preview '[[ $(file --mime {}) =~ binary ]] && echo {} is a binary file || (highlight -O ansi -l {} || coderay {} || rougify {} || cat {}) 2> /dev/null | head -500'"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# FZF Git
[ -f ~/.forgit/forgit.plugin.zsh ] && source ~/.forgit/forgit.plugin.zsh

# Gitlab
if [[ -f $HOME/.gitlab_token ]]
then
    export GITLAB_API_PRIVATE_TOKEN=$(cat $HOME/.gitlab_token)
fi
export GITLAB_API_ENDPOINT="https://gitlab.com/api/v3"
