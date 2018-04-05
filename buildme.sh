#!/bin/bash

# cd to location where the script is stored
cd "$(dirname "${BASH_SOURCE[0]}")"

fileList=`find ./src/ -name '*.md'`
count=0

rm -rf ./obj

for file in $fileList
do
    parent_dir=`dirname $file`

    dir=`dirname ${file/src/obj}`
    # if directory does not exist create parent directories
    if [ ! -d $dir ]; then
        mkdir -p $dir
    fi
    # create output file name
    filename=`basename $file`
    outfile="$dir/${filename%.*}.html"

    # remove old files
    rm -rf "$dir/*"

    #copy all the files of the problem
    cp $parent_dir/* $dir

    #compile the md file to html
    echo "Compiling : $file -> $outfile"
    perl ./markdown/Markdown.pl --html4tags $file > $outfile

    count=$(( $count + 1))
done
echo "Done compiling $count files"

# create links to checkers inside obj
ln -s ../checkers ./obj/checkers
