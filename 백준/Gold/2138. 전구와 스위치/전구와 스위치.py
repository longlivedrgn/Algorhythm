import copy

N = int(input())
start_bulbs = [int(char) for char in input()]
goal_bulbs = [int(char) for char in input()]
start_bulbs_clone = copy.deepcopy(start_bulbs)

count = 0
count_not_start = 0

real_count = -1
real_count_not_start = -1

def toggle(bulbs, index):
    global N
    if bulbs[index] == 0:
        bulbs[index] = 1
    else:
        bulbs[index] = 0

    if index-1 >= 0 and bulbs[index-1] == 0:
        bulbs[index-1] = 1
    elif index-1 >= 0 and bulbs[index-1] == 1:
        bulbs[index-1] = 0

    if index+1 < N and bulbs[index+1] == 0:
        bulbs[index+1] = 1
    elif index+1 < N and bulbs[index+1] == 1:
        bulbs[index+1] = 0

toggle(start_bulbs, 0)

count += 1
for i in range(1,N):
    if start_bulbs[i-1] != goal_bulbs[i-1]:
        toggle(start_bulbs, i)
        count += 1
for i in range(1, N):
    if start_bulbs_clone[i-1] != goal_bulbs[i-1]:
        toggle(start_bulbs_clone, i)
        count_not_start += 1

if start_bulbs == goal_bulbs:
    real_count = count
if start_bulbs_clone == goal_bulbs:
    real_count_not_start = count_not_start

if real_count == -1 and real_count_not_start == -1:
    print(-1)
else:
    minimum = min(real_count_not_start, real_count)
    if minimum == -1:
        print(max(real_count_not_start, real_count))
    else:
        print(minimum)
