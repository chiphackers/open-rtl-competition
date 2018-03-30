<!--
name=SortedClocks
major_type=eda
minor_type=heapsort
author=dimuthu
checker=py_out
difficulty=easy
points=10
-->

Flop Count
==========

Introduction
------------

Detecting the clocks which drives maximum and
minimum number of flip flops
In a complex design, one clock may drive several flip flops. For an
example synchronous up-down counters use one clock to drive
several flip flops at the same time.

####Algorithm to count Flip Flops :####

1. Modify the netlist by adding an additional Net before the input ports which will be driving all the input ports.
2. Start a breadth first search from that node which will terminate only after all the nodes are visited.
3. When first time visiting a node check type(node)=='FLOP': if the condition is true increment the FLOP count
4. Return the final count

Submission Guidelines
---------------------

* Start your solution by importing SimpleNetlist as shown in below command :
```
from SimpleNetlist import *
```
* Your solution should be avaliable in a function declared as below :
```
def solution(netlist):
```
* Return value of the function should be of type int which represent the count of flip flops in the netlist.
* Evaluation system will pass different netlists to verify the correctness of the algorithm.
* You may declare other supporting function in your answer.
