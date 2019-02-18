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

#LS_COLORS=$LS_COLORS:'di=0;35:' ; export LS_COLORS

# User specific environment and startup programs
#parse_git_branch() {
#     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
#}
#export PS1="\u@\h \[\033[31m\]\w\[\033[33m\]\$(parse_git_branch)\[\033[00m\] $ "
#export PS1='\e[0;34m<$(curwd)>\e[m[$(sso-id)]\e[0;31m<$(gitBranch)>\e[m\n[\!] daf:'']]]]'



#if [ -f `which powerline-daemon` ]; then
#  powerline-daemon -q
#  POWERLINE_BASH_CONTINUATION=1
#  POWERLINE_BASH_SELECT=1
#. ~/Library/Python/2.7/lib/python/site-packages/powerline/bindings/bash/powerline.sh
#fi
#export PS1="\e[m[$(sso-id)]] $ "



function _update_ps1() {
    PS1=$(powerline-shell $?)
}

if [[ $TERM != linux && ! $PROMPT_COMMAND =~ _update_ps1 ]]; then
    PROMPT_COMMAND="_update_ps1; $PROMPT_COMMAND"
fi


command_exists(){
  type "$1" &> /dev/null ;
}

# if vimx available enable it
if command_exists vimx; then
  alias vim='vimx'
fi


#golang_version =
#sudo ln -s /usr/local/Cellar/go@1.8/1.8.7 /usr/local/go
# export GOROOT=/usr/local/go
export GOPATH=~/projects/go
#export PATH=$PATH:$HOME/projects/go/bin:$GOROOT/bin
export PATH=$PATH:$HOME/projects/go/bin
# If you need to have go@1.8 first in your PATH run:

# go lang 1.8
#export GOROOT=/usr/local/opt/go@1.8/bin
#export PATH=/usr/local/opt/go@1.8/bin:$PATH


# If you need to have go@1.10 first in your PATH run:
#export GOROOT=/usr/local/opt/go@1.10/bin
# export PATH=/usr/local/opt/go@1.10/bin:$PATH



# b) function cd_func
# This function defines a 'cd' replacement function capable of keeping,
# displaying and accessing history of visited directories, up to 10 entries.
# To use it, uncomment it, source this file and try 'cd --'.
# acd_func 1.0.5, 10-nov-2004
# Petar Marinov, http:/geocities.com/h2428, this is public domain
cd_func ()
 {
   local x2 the_new_dir adir index
   local -i cnt

   if [[ $1 ==  "--" ]]; then
     dirs -v
     return 0
   fi

   the_new_dir=$1
   [[ -z $1 ]] && the_new_dir=$HOME

   if [[ ${the_new_dir:0:1} == '-' ]]; then
     #
     # Extract dir N from dirs
     index=${the_new_dir:1}
     [[ -z $index ]] && index=1
     adir=$(dirs +$index)
     [[ -z $adir ]] && return 1
     the_new_dir=$adir
   fi

   #
   # '~' has to be substituted by ${HOME}
   [[ ${the_new_dir:0:1} == '~' ]] && the_new_dir="${HOME}${the_new_dir:1}"

   #
   # Now change to the new dir and add to the top of the stack
   pushd "${the_new_dir}" > /dev/null
   [[ $? -ne 0 ]] && return 1
   the_new_dir=$(pwd)

   #
   # Trim down everything beyond 11th entry
   popd -n +11 2>/dev/null 1>/dev/null

   #
   # Remove any other occurence of this dir, skipping the top of the stack
   for ((cnt=1; cnt <= 10; cnt++)); do
     x2=$(dirs +${cnt} 2>/dev/null)
     [[ $? -ne 0 ]] && return 0
     [[ ${x2:0:1} == '~' ]] && x2="${HOME}${x2:1}"
     if [[ "${x2}" == "${the_new_dir}" ]]; then
       popd -n +$cnt 2>/dev/null 1>/dev/null
       cnt=cnt-1
     fi
   done

   return 0
 }

alias cd=cd_func


#aws-iam-authenticator
#echo 'export PATH=$HOME/bin:$PATH' >> ~/.bash_profile

# Bash completion for kubernetes
. /usr/local/etc/profile.d/bash_completion.sh
source <(kubectl completion bash)

#Bash history specific
export PATH=$HOME/bin:$PATH
#source <(kubectl completion bash)
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

