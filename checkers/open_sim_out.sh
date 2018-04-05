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

############# Complie  #############

iverilog TEST testbench.v |& tee compile.log

if [ "`cat compile.log`" != "" ]; then
    echo "[ERROR  ]: compilation failed"
    echo "----------[LOG]------------"
    cat compile.log
    echo "----------[END]------------"
    exit 1
fi

######### Sanity Work ###############
if [ -f sim.out ]; then
    rm sim.out
fi

######### Simulate #################
vvp a.out > sim.out


######### Line count check #########
line_count_sim=`cat sim.out | wc -l`
line_count_sol=`cat SOLUTION | wc -l`

if [[ $line_count_sim != $line_count_sol ]]; then
    echo "[ERROR  ]: Output mismatch found. Do you have any \$display in your designs. Please remove them."
    exit 1
fi

######### Sanity Work ###############
if [ -f diff.out ]; then
    rm diff.out
fi

######### DIFF ######################
diff --new-line-format="[ERROR  ]: %L" --old-line-format="" --unchanged-line-format="[PASS   ]: %L" SOLUTION sim.out |& tee diff.out
echo -e "\n[ TESTING DONE ]\n"

grep -s -q '^\[ERROR  \]:' diff.out

if [[ $? == 0 ]]; then
    echo "[ERROR  ]: Your design is not correct"
    exit 1
else
    echo "[SUCCESS]: Your solution works"
    exit 0
fi
