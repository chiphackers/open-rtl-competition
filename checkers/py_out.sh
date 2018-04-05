#!/bin/bash

######### System Check ##############
if [ "`which python3`" == "" ]; then
    echo "[ERROR  ]: python3 not found can't run"
    exit 1;
fi

######### Set Python Path ###########
export PYTHONPATH=../../../ch-tools/SimpleNetlist

######### Input Check ###############
if [ -z $1 ]; then
    echo "[ERROR  ]: Invalid location"
    exit 1;
fi

######### Goto Answer ###############
TEST_DIR=$1
cd $1

######### Sanity Work ###############
if [ -f run.out ]; then
    rm run.out
fi

if [ ! -f TEST ]; then
    echo "[ERROR  ]: Uploaded solution is not found"
    exit 1
fi
    
############# RUN ###################
cp TEST test.py
python3 testbench.py |& tee run.out


######### DIFF ######################
echo -e "\n[ TESTING DONE ]\n"

grep -s -q '^\[ERROR  \]:' run.out

if [[ $? == 0 ]]; then
    echo "[ERROR  ]: Your design is not correct"
    exit 1
else
    echo "[SUCCESS]: Your solution works"
    exit 0
fi
