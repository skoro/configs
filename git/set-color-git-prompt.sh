# Color reference -> ../bash/ansi_colors_echo

# Put below in your $HOME/.bashrc (Ubuntu/Debian).
GIT_PROMPT=$HOME/.local/git-prompt.sh
if [ -f $GIT_PROMPT ]; then
    source $GIT_PROMPT
	PS1='\e[32m\u@\h \e[94m\w \e[1m\e[93m$(__git_ps1 "git:%s")\e[22m\e[39m\n\$ '
	GIT_PS1_SHOWDIRTYSTATE=1
	GIT_PS1_SHOWUNTRACKEDFILES=1
fi

