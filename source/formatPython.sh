# Autoformats a python file. This requires autopep8 to
# be installed (which in turn requires pep8)

# Arguments:
# Variable number of arguments. Each one is the path to
# a python file to format, or a directory containing
# python files to format

if [ $# == 0 ] 
then
	echo 'No files to format!'
	exit 1
fi

# Formats a single python file
format () {
	echo "Formatting '$1'"
	autopep8 --in-place $1
}

# Formats all files in a directory
format_dir () {
	if [[ -d "$1" ]]; then
		for i in `ls -d1 $1/**/*`; do 
			format_dir $i
		done
	elif [[ -f "$1" ]]; then
		fileext="${1##*.}"
		if [[ $fileext == "py" ]]; then
			format $1
		fi
	else
		echo "Cannot format '$1'"
	fi
}

for path in "$@" 
do
	format_dir $path
done
