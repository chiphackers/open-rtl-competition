<!--
name=Simple Adder
major_type=seq
minor_type=test
author=udara
checker=sim_out
difficulty=easy
points=10
-->

4bits Adder
===========

Design a four bits binary adder. Ignore the carry out of the operation. Input and output of the system are shown in the below table.

Your solution should have only one module with the name test. IO signal should exactly match the signal names mentioned in the table
else the answer is considered wrong.

System IOs
----------


| Signam Name | IO direction | Bits width |  Function           | 
|-------------|--------------|------------|---------------------| 
| data_a_i    | INPUT        | 4          |          _          | 
| data_b_i    | INPUT        | 4          |          _          | 
| data_o      | OUTPUT       | 4          | data_a_i + data_b_i | 


Example
-------

```
if
    data_a_i = 4'b0001
    data_b_i = 4'b0001
then
    data_o = 4'b0010
```
