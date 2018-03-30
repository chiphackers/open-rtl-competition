<!--
name=HangingNets
major_type=eda
minor_type=bfs
author=shehan
checker=py_out
difficulty=easy
points=10
-->

HangingNets
===========

Introduction
------------

The disconnections in a circuit lead to different problems while developing electronic tools. XYZ,
leading company in semiconductor technology sector, wants to build a functionality to identify
disconnections/hanging nets in a netlist.
The task is to develop a function in Python language to identify disconnections in a given netlist. The
function should be able to traverse from inputs of the netlist to outputs of the netlist. For traversing,
Breadth First Search algorithm needs to be used.

####Algorithm to count Flip Flops :####

1. Modify the netlist by adding an additional Net before the input ports which will be driving all the input ports.
2. Start a breadth first search from that node which will terminate only after all the nodes are visited.
3. When first time visiting a node check if node.getType() == 'NET' and len(node.getLoads()) == 0: if the condition is true add the net to the hanging nets list
4. Return the final hanging nets list

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
* Return value of the function should be of type list which contains all the hanging nets of the circuit.
* Evaluation system will pass different netlists to verify the correctness of the algorithm.
* You may declare other supporting function in your answer.
