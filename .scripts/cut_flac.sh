#!/bin/bash

fix () {
for a in *.flac; do
ARTIST=`metaflac "$a" --show-tag=ARTIST | sed s/.*=//g`
TITLE=`metaflac "$a" --show-tag=TITLE | sed s/.*=//g`
if [ "$ARTIST" == '' ]
then
mv "$a" "$TITLE.flac"
else
mv "$a" "$ARTIST - $TITLE.flac"
fi
done
}

reaper () {
cuebreakpoints *.cue | shnsplit -o flac *.flac
cuetag.sh *.cue split-track*.flac
rm "$(ls *.flac | grep -v 'split-track')"
rm *.cue
fix
}

artist () {
for a in *.flac; do
metaflac "$a" --set-tag ARTIST="$2"
done
}

help () {
echo "Usage:"
echo "      $0"
echo "Main options:"
echo "    -a  --artist  : set ARTIST for all songs"
echo "    -f  --fix     : fix songs name ARTIST - TITLE or TITLE"
echo "    -r  --reaper  : cut flac on tracks and add metatags"
echo "    -h  --help    : print help and exit"
}

case $1 in
-a|--artist)  artist     ;;
-r|--reaper)  reaper     ;;
-f|--fix)     fix        ;;
-h|--help)    help       ;;
*)
echo "'$1' is not valid command"
help
;;
esac

exit 0
