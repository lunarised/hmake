#!/bin/bash
set -e

function usage {
	cat <<EOF
Usage: $0 [-h] filename

Creates an HTML skeleton with filled headers

-h | Show help
EOF
}

while getopts "h" o; do
	case "$o" in
		h)usage;;
		:)echo "Missing option argument for -$OPTARG";exit 1;;
	esac
done
shift $((OPTIND -1))
finame="${@:-1}"
if [ -z "$@" ]; then
echo "Filename missing"
echo "The Program will now exit"
exit 1
fi
fname="$finame.html"
if [ -e $fname ]; then
read -p "File of this name exists. Do you wish to delete it (y/n) " answer
case ${answer:0:1} in
	y|Y)
		rm $fname;;
	*)
		exit 0;;
esac
fi
touch $fname
echo "<!DOCTYPE HTML>" >> $fname
echo "<html lang = ""'""en""'"">" >> $fname
echo "<head>" >> $fname
echo "<meta charset=\"UTF-8\">" >> $fname
echo "<title> $fname </title>" >> $fname
echo "<link rel=\"stylesheet\" type=\"txt/css\" href=\"style.css\">" >> $fname
echo "</head>" >> $fname
echo -e "<body>\n</body>\n</html>" >> $fname

