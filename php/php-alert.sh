#!/bin/sh

LOG=/var/log/apache2/error.log

# TODO: add --help option

if test $# != 0 ; then
  LOG="$@"
fi

last=$(date +%s)

tail -f $LOG | while read line; do
  for x in "PHP Notice" "PHP Warning" "PHP Fatal error" "PHP Parse error"
  do
    now=$(date +%s)
    if test $(($now - $last)) -gt 1 ; then
      message=`echo $line | sed -n "s/^.*$x:[ ]*//p"`
      if test -n "$message" ; then
        notify-send -c PHP -i gtk-dialog-warning -u low "$x" "$message"
        last=$now
      fi
    fi
  done
done

