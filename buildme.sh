#!/bin/bash

# cd to location where the script is stored
cd "$(dirname "${BASH_SOURCE[0]}")"

# check if auto_sync.sh exist if not generate it
SYNC_SCRIPT="./.auto_sync.sh"
if [ ! -f $SYNC_SCRIPT ]; then
    if [ "`which expect`" == "" ]; then
        echo "[ ERROR ]: expect is not found in PATH"
        exit 0
    fi
    
    read -p "Enter git password : " -s GIT_PASSWORD
    echo ""
    GIT_PASSWORD="`echo $GIT_PASSWORD | base64`"
    EXPECT_EXE="`which expect`"
    
    touch $SYNC_SCRIPT
    echo -e "#!$EXPECT_EXE"                                                         >> $SYNC_SCRIPT
    echo -e ""                                                                      >> $SYNC_SCRIPT
    echo -e "set timeout 9"                                                         >> $SYNC_SCRIPT
    echo -e "spawn git pull origin master"                                          >> $SYNC_SCRIPT
    echo -e "expect {"                                                              >> $SYNC_SCRIPT
    echo -e "    timeout { send_user \"\nFailed to get password\n\"; exit 1; }"     >> $SYNC_SCRIPT
    echo -e "    eof { send_user \"\nConnection Failed\n\"; exit 1; }"              >> $SYNC_SCRIPT
    echo -e "    \"Password for\""                                                  >> $SYNC_SCRIPT
    echo -e "}"                                                                     >> $SYNC_SCRIPT
    echo -e "send \"`echo $GIT_PASSWORD | base64 --decode`\r\""                     >> $SYNC_SCRIPT
    echo -e "expect {"                                                              >> $SYNC_SCRIPT
    echo -e "    timeout { send_user \"\ngit pull failed\n\"; exit 1; }"            >> $SYNC_SCRIPT
    echo -e "}"                                                                     >> $SYNC_SCRIPT
    sudo chmod +x $SYNC_SCRIPT
fi

# get the latest revision of repository
$SYNC_SCRIPT

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
