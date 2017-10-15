#!/bin/bash
while test $# -gt 0; do
    case "$1" in
        -h|--help)
            echo "Usage: `basename $0` -t (start time-finish time) -o (file name) [youtube link]"
            echo "example:"
            echo "./dl.sh  -t 00:03-00:10 -o \"Mysong - name.mp3\" youtube.com/watch?v=ajajjaja"
            echo ""
            echo "requirements:"
            echo "sudo aptitude install poc-streamer youtube-dl"
            echo "pip install eyed3"
            exit 0
            ;;
        -t)
            shift
	        cut_time=$1
            shift
            ;;
        -o)
            shift
            new_name=$1
            shift
            ;;
        *)
            break
            ;;
    esac
done


youtube-dl -f bestaudio --extract-audio --audio-format mp3 -o "%(title)s.%(ext)s" $1
file_name=$(youtube-dl --get-filename --audio-format mp3 -o "%(title)s.mp3" $1)

if [ ! -z $cut_time ];
then
    #crop time was given
    mp3cut -o temp.mp3 -t "$cut_time" "$file_name"
    mv temp.mp3 "$file_name"
fi

if [ ! -z "$new_name" ];
then
    #song name was given
    mv "$file_name" "$new_name"
    file_name="$new_name"
fi

python tags.py "$file_name"
mv "$file_name" $HOME"/Music/$file_name"
echo "$file_name" created
