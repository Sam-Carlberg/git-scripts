# Copies all scripts to the given directory
# This may overwrite existing files with the same
# name

# Arguments:
# 1. The directory to copy the scripts into

if [ $# == 0 ] 
then
	echo 'No destination folder provided!'
	exit 1
fi

dest=$1

echo Destination: $dest

mkdir $dest

find ./source/ -name "*.sh" -exec cp {} $dest \;
