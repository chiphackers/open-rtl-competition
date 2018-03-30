from mynetlist import *

import solution
import test


your_list = test.solution(netlist)
right_list = solution.solution(netlist)

print('[INFO   ]: Your Hanging Nets List : %s' % [ str(net) for net in your_list ])
print('[INFO   ]: Correct Hanging Nets List : %s' % [ str(net) for net in right_list ])

correct = True
for net in right_list:
    try:
        your_list.remove(net)
    except:
        print('[ERROR  ]: Hanging net %s is not in your answer' % str(net))
        correct = False

if your_list:
    print('[ERROR  ]: These are not hanging nets %s' % [ str(net) for net in your_list])
    correct = False

if not correct:
    print('[ERROR  ]: Hanging net detection is not correct')
else:
    print('[SUCCESS]: Hanging net detection is correct')

