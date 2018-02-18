#!/bin/sh

# The script is for installing dot files into
# user home directory.
# To apply effect relogin will needed.

DOTFILES="inputrc nanorc"

for f in $DOTFILES; do
	dst=$HOME/.$f
	if [ -f $dst ]; then
	    echo "Backup: $dst"
		cp $dst $dst.bak
	fi
	cp $f $dst
done
