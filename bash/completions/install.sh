#!/bin/sh

FILES="composer           \
       vagrant            \
       wp-completion.bash \
       docker-compose     \
       yii"

DEST=$HOME/.config/bash_completion.d
if [ ! -d $DEST ]; then
    mkdir -p $DEST
fi

COMP=$HOME/.config/bash_completion
if [ -f $COMP ]; then
    mv $COMP $COMP.bak
fi

for f in $FILES; do
    echo -n "Install: $f [Y/n] ?"
    read a
    if [ x"$a" = x"" -o x"$a" = x"y" ]; then
        cp $f $DEST/$f && \
            echo ". $DEST/$f" >> $COMP
    fi
done

echo "To apply completions you need to relogin."
echo "If you use Xfce/Gnome/KDE terminal don't forget"
echo "to enable 'Run command as login shell' option (for Xfce)."

