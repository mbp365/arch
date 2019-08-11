source /home/max/.bashrc

tempfile="$(mktemp -t tmp.XXXXXX)"
ranger --choosedir="$tempfile" "${@:-$(pwd)}"
test -f "$tempfile" &&
if [ "$(cat -- "$tempfile")" != "$(echo -n `pwd`)" ]; then
    cd -- "$(cat "$tempfile")"
fi
rm -f -- "$tempfile"

