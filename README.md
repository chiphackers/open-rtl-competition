# open-rtl-competition

This repository contains an open rtl (register-transfer-level) competition that is hosted in [chiphackers](https://chiphackers.com)

## About open-rtl-competition

The main purpose of this repository is to explain the hackathon repository structure.
Competition is also active at [chiphackers](https://chiphackers.com) for anyone to try.
The problem tests for RTL design skills and require participants to have Verilog coding skills.

## Contributions

This repository is used as an example for hackathon repository structure required by chiphackers hackathon platform.
However the problems is avaliable to solve at [chiphackers](https://chipahackers.com).
If you like to add new problems please create a pull request.

## Files and Directories

### buildme.sh

This is the build script of the repository. When executed it will compile all problems in src directory and produce obj directory.
It will ask for your github password. The password will be stored in a file .auto\_sync.sh with base64 encoding. 
The .auto\_sync.sh file is a generated file and not part of the repository. Since it contains sensitive information (encoded password) this file is added to .gitignore file to avoid users accidently commiting it to a public repository.
    
### checkers

This directory contains the collection of checkers used to verify the correctness of the solutions submitted to problem.
In each problem description there is mandatory header. This header contains which checker should be used to verify correctness.
When build.me is executed it will also create a link to checkers directory inside obj directory.

### markdown

This directory contains a third-party markdown compiler which will compile the markdown problem description into html.

## Problem Header

Problem header is mandatory for each problem and should be included in the problem description file. Problem description is a markdown file with the same directory name and .md extention. A sample problem header is shown below

```
<!--
name=FlopCount
major_type=seq
minor_type=flop
author=udara
checker=py_out
difficulty=easy
points=10
-->
```

The information contain in the problem header will be used by chiphackers hackathon platform to extract information about the problem. Missing header or invalid properties in the header will result in undesired problem listing in the hackathon.

