#!/bin/bash

source git-prompt.sh

# Color reference -> ../bash/ansi_colors_echo
# In .profile or .bash_profile set the following variables:
export PS1='\e[32m\u@\h \e[94m\w \e[1m\e[93m$(__git_ps1 "git:%s")\e[22m\e[39m\n\$ '
export GIT_PS1_SHOWDIRTYSTATE=1
export GIT_PS1_SHOWUNTRACKEDFILES=1

