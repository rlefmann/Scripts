progname=$(basename "$0")


if [ $# -lt 2 ]; then
	echo "Usage: $progname SOURCE NEWNAME"
	echo
	echo "Rename SOURCE to NEWNAME while preserving the file extension"
	echo
	echo "  -f  consider everything after the first dot"
	echo "      in the file name as the extension rather"
	echo "      than everything after the last dot"
	echo "  -v  explain what is being done"
	exit 1
fi

while getopts "fv" opt; do
	case "$opt" in
		f) EXTENSION_AFTER_FIRST_DOT=1 ;;
		v) VERBOSE=1 ;;
		*) exit 1 ;;
	esac
done

shift "$((OPTIND-1))"

dname=$(dirname "$1")
bname=$(basename "$1")
if [ -z $EXTENSION_AFTER_FIRST_DOT ]; then
	xname="${bname##*.}"
else
	xname="${bname#*.}"
fi

if [ -n $VERBOSE ]; then
	mv -v "$1" "$dname/$2.$xname"
else
	mv "$1" "$dname/$2.$xname"
fi
