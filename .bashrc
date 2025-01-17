# ~/.bashrc: executed by bash(1) for non-login shells.

# Note: PS1 and umask are already set in /etc/profile. You should not
# need this unless you want different defaults for root.
# PS1='${debian_chroot:+($debian_chroot)}\h:\w\$ '
# umask 022

export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced
export PS1='\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
export LC_ALL=C
export NODE_OPTIONS=--openssl-legacy-provider

# You may uncomment the following lines if you want `ls' to be colorized:
export LS_OPTIONS='--color=auto'
eval "`dircolors`"
alias ls='ls $LS_OPTIONS'
alias ll='ls $LS_OPTIONS -l'
alias l='ls $LS_OPTIONS -lA'
#
# Some more alias to avoid making mistakes:
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias svnst="svn st | awk '!/public/' "
alias mysql='mysql --pager="less -SX"'
alias svnaddall='svn add . --force'
alias st="status"

function crdiff {
  local numberOfModifiedFiles=$(eval "svn st | awk '{print $2}' | awk '!/public/' | wc -l")  
  if (( $numberOfModifiedFiles > 0 )); then 
    svn diff $(svn st | awk '!/\?/' | awk '{print $2}' | awk '!/public/') | colordiff | less -R
  else
    echo "There are no files to edit"
  fi
}

function dateup {
  sudo date -s "$(wget -qSO- --max-redirect=0 google.com 2>&1 | grep Date: | cut -d' ' -f5-8)Z"
}

function goup {
  num=$1
  while [ $num -ne 0  ];do
    cd ..
    num=$((num-1))
  done
}
