<!--
name=Sequence Generator
major_type=seq
minor_type=counter
author=udara
checker=sim_out
difficulty=easy
points=10
-->

Sequence Generator
==================

Write a design to generate the following binary sequence : 000, 010, 011, 101

foreach positive clk edge :
output : 000 -> 010 -> 011 -> 101

reset condition :
Synchronous active high ( i.e Reset will happen when rst=1 at positive edge of clk)

Your solution should have only one module with the name test. IO signal should exactly match the signal names mentioned in the table
else the answer is considered wrong.

System IOs
----------


| Signam Name | IO direction | Bits width |  Function                         | 
|-------------|--------------|------------|-----------------------------------| 
| clk         | INPUT        | 1          |          _                        |
| rst         | INPUT        | 1          |          _                        | 
| out         | OUTPUT       | 3          |   @( posedge clk ) next value     | 


Example template
----------------

```
module test (
    input clk, rst, i0,
    output [2:0] out );

// your logic goes here

endmodule
```
