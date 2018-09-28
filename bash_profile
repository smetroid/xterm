export PATH="$HOME/Library/Python/2.7/bin:$PATH"
eval "$(onica-sso shell-init bash)"


# Function that adds a ncurses dialog picker for onica-sso
# with caching. Added to my .bash_profile after installing `dialog`

SSO_CACHE_FILE=/tmp/sso-list-cache.txt
function sso() {
  if [ ! $(which dialog) ]
  then
    echo "dialog not installed. Try 'brew install dialog' first!"
    exit
  fi

  # Remove cache file if it's older than a day
  find $SSO_CACHE_FILE -mtime +1 -exec rm -v {} \;

  if [ ! -f $SSO_CACHE_FILE ]
  then
    onica-sso list > $SSO_CACHE_FILE
  fi

  # Perhaps the file has no lines?
  if [ $(cat $SSO_CACHE_FILE | wc -l | tr -d [:space:] ) -lt 1 ]
  then
    onica-sso list > $SSO_CACHE_FILE
  fi

  if [ $# -gt 0 ]
  then
    sso_list=$(cat $SSO_CACHE_FILE | grep $1 | awk 'BEGIN{COUNT=1}{printf("%d %s\n", COUNT, $1);COUNT++;}')
  else
    sso_list=$(cat $SSO_CACHE_FILE | awk 'BEGIN{COUNT=1}{printf("%d %s\n", COUNT, $1);COUNT++;}')
  fi

  if [ $(echo $sso_list | wc -c | tr -d [:space:] ) -lt 2 ]
  then
    echo "No results for $1"
    return
  fi

  exec 3>&1;
  result=$(dialog --clear --backtitle "Onica SSO List" --title "Account" --menu "Choose one of the following" 25 80 20 \
  $(echo $sso_list) 2>&1 1>&3);
  exitcode=$?;
  exec 3>&-;

  if [ $exitcode -ne 0 ]
  then
    echo "Canceled."
    return
  fi

  exec 3>&1;
  MFA=$(dialog --clear --backtitle "Onica SSO List" --title "Token" --form "" 6 22 0 "MFA: " 1 1 "$mfa" 1 10 10 0 2>&1 1>&3)
  exitcode=$?;
  exec 3>&-;

  if [ $exitcode -ne 0 ]
  then
    echo "Canceled."
    return
  fi

  CONNECT_TO=$(echo $sso_list | awk -F "$result " '{printf("%s\n", $2);}'|cut -f 1 -d ' ')

  eval $(onica-sso login $CONNECT_TO $MFA)
  clear
  export |grep AWS
}

#test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"

# User specific aliases and functions

alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

alias ls='LSCOLORS=gxfxcxdxbxexexabagacad /bin/ls -bFHGLOPW'

powerline-daemon -q
POWERLINE_BASH_CONTINUATION=1
POWERLINE_BASH_SELECT=1
. ~/Library/Python/2.7/lib/python/site-packages/powerline/bindings/bash/powerline.sh

#LS_COLORS=$LS_COLORS:'di=0;35:' ; export LS_COLORS

# User specific environment and startup programs
#parse_git_branch() {
#     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
#}
#export PS1="\u@\h \[\033[31m\]\w\[\033[33m\]\$(parse_git_branch)\[\033[00m\] $ "

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

