from SimpleNetlist import *

import solution
import test

netlist = SimpleNetlist('top1')

netlist.addPort('in','in1')
netlist.addPort('in','in2')
netlist.addPort('in','in3')
netlist.addPort('out','out1')

and1 = AND2(netlist)
flop = FLOP(netlist)
inv1 = INV(netlist)
and2= AND2(netlist)
   
netlist.addCell(and1)
netlist.addCell(flop)
netlist.addCell(inv1)
netlist.addCell(and2)

net1 = Net(netlist)
net1.addDriver(netlist.getPort('in1'))
net1.addLoad(and1.input(0))
netlist.addNet(net1)

net2 = Net(netlist)
net2.addDriver(netlist.getPort('in2'))
net2.addLoad(and1.input(1))
netlist.addNet(net2)

net3 = Net(netlist)
net3.addDriver(and1.output(0))
net3.addLoad(flop.input(0))
netlist.addNet(net3)

net4 = Net(netlist)
net4.addDriver(netlist.getPort('in3'))
net4.addLoad(flop.input(1))
netlist.addNet(net4)

net5 = Net(netlist)
net5.addDriver(flop.output(0))
net5.addLoad(inv1.input(0))
netlist.addNet(net5)

net6 = Net(netlist)
net6.addDriver(inv1.output(0))
net6.addLoad(netlist.getPort('out1'))
netlist.addNet(net6)

your_count = test.solution(netlist)
right_count = solution.solution(netlist)

print('[INFO   ]: Your Flop Count : %d' % test.solution(netlist))
print('[INFO   ]: Correct Flop Count : %d' % solution.solution(netlist))

if test.solution(netlist) != solution.solution(netlist):
    print('[ERROR  ]: Flop Count is wrong')
else:
    print('[SUCCESS]: Flop Count is correct')

