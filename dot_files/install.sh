#!/bin/sh

# The script is for installing dot files into
# the user home directory.
# To apply these changes relogin will be needed.

DOTFILES="inputrc nanorc bash_aliases"

for f in $DOTFILES; do
	dst=$HOME/.$f
	if [ -f $dst ]; then
	    echo "Backup: $dst"
		cp $dst $dst.bak
	fi
	cp $f $dst
done
