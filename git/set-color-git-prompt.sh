#!/bin/bash

. git-prompt.sh

# Color reference -> ../bash/ansi_colors_echo
PS1='\e[32m\u@\h \e[34m\W\e[35m$(__git_ps1 " (%s)")\e[39m\$ '

