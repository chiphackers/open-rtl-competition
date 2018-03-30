from SimpleNetlist import *

def FlopCount(netlist, start):
    explored=[]
    queue=[]+start
    FLOPS=[]
    while queue:
        node = queue.pop(0)
        if node not in explored:
            if type(node)==FLOP:
                FLOPS.append(node)
            explored.append(node)
            neighbours = netlist.getNeighbours(node)
        for neighbour in neighbours:
            queue.append(neighbour)
    return FLOPS

def solution(netlist):
    inputPoints = netlist.getInputPorts()
    flop=FlopCount(netlist, inputPoints)

    return (len(flop))

