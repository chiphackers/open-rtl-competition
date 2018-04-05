#!/bin/bash

######### System Check ##############
if [ "`which iverilog`" == "" ]; then
    echo "[ERROR  ]: iverilog not found can't simulate"
    exit 1;
fi

######### Input Check ###############
if [ -z $1 ]; then
    echo "[ERROR  ]: Invalid location"
    exit 1;
fi

######### Goto Answer ###############
TEST_DIR=$1
cd $1

######### Sanity Work ###############
if [ -f compile.log ]; then
    rm compile.log
fi

######### Start Testing #############

iverilog TEST testbench.v |& tee compile.log

if [ "`cat compile.log`" != "" ]; then
    echo "[ERROR  ]: compilation failed"
    echo "----------[LOG]------------"
    cat compile.log
    echo "----------[END]------------"
    exit 1
fi

sim_out=`vvp a.out`

if [ "$sim_out" != "`cat SOLUTION`" ]; then
    echo "[ERROR  ]: Your design is not correct"
    exit 1
else
    echo "[SUCCESS]: Your solution works"
    exit 0
fi
