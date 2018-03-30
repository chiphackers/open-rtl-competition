<!--
name=FlopCount
major_type=eda
minor_type=bfs
author=shehan
checker=py_out
difficulty=easy
points=10
-->

Flop Count
==========

Introduction
------------

ABCD Corporation is a major company in technology field. The company wants to implement a new system called AIA which is able to develop processor models under the given specification and conditions.
One of the main functionality of processor modeling is to design digital counters. Powerful processors are comprised with several digital counters. 
Digital counters are implemented using flip flops. For the maximum efficiency and area reduction when fabricating the chip, the engineers planned to design digital counters using minimum number of flip flops. 
Since AIA system is functioning automatically, a new functionality is needed to count the flip flops of a digital counter.
**The task is to develop a python function to count the flip flops in each digital counter circuit.**
The function should be able to traverse from inputs of the net list to outputs of the net list. 
For traversing, Breadth First Search algorithm needs to be used as described in the below pseudocode.

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
