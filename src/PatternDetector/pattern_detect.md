<!--
name=pattern_detector
major_type=Sequential
minor_type=FSM
author=udara
checker=open_sim_out
language=verilog
abstract=Every communication protocol requires a pattern detector in the receiver. Try to detect this simple five bit pattern.
difficulty=moderate
points=10
-->

Pattern Detector
================

> Detect 11010 bit pattern from user input stream.
                
**IMPORTANT :** module name should be **solution**. If a different module name is used it will fail in the test run.

I/O Description
---------------

| Name     |  Type   |  Direction |  Width   | Description   |
|----------|---------|------------|----------|---------------|
| data     |  User   |    Input   | 1 bit    | A dip switch which will be either 1 or 0. This represents the user input stream |
| trig     |  User   |    Input   | 1 bit    | A push button which indicates whether input is valid or not |
| reset    |  User   |    Input   | 1 bit    | Asynchronous active high reset |
| clk      |  System |    Input   | 1 bit    | System clock  |
| on\_led  |  Design |    Output  | 1 bit    | Power on indicator |
| led      |  Design |    Output  | 5 bit    | Display the current state of the detector |

Details
-------

* *data*, dip switch can be either 1 or 0. However the value of this input is sampled only when *trig* is pressed.
* *led*, are five led indicators which represents the current state of the system.
* When 11010 pattern is detected all *led* indicators will be on.

Example
-------

```
data   :   00110100011111110101101001 
led[0] :   --xxxxx--xxxxxxxxxxxxxxx-x 
led[1] :   ---xxxx---xxxxxxxxx-xxxx--
led[2] :   ----xxx---------xxx--xxx--
led[3] :   -----xx----------xx---xx--
led[4] :   ------x-----------x----x--

```
