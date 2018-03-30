from SimpleNetlist import *

def solution(netlist):

    # adding dummy net
    dummyNet = Net(netlist)
    for port in netlist.getInputPorts():
        dummyNet.addLoad(port)

    netlist.addNet(dummyNet)
    start = [dummyNet]

    explored=[]
    Path={'start':start}
    queue=[]+start
    HN=[]   # Hanging Nets List
    while queue:
        node = queue.pop(0)
        if (type(node)==Net) and (node not in start) :
            if (len(node.getDrivers()) == 0) or (len(node.getLoads()) == 0) :
                HN.append(node)
        if node not in explored:
            explored.append(node)
            neighbours = netlist.getNeighbours(node)
            Path[node]=neighbours
            for neighbour in neighbours:
                queue.append(neighbour)
    return HN
