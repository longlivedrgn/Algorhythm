from collections import deque

def solution(bridge_length, weight, truck_weights):
    # 두 개의 queue를 활용하는 방법
    time = 0
    truck_weights = deque(truck_weights)
    bridges = deque([0] * bridge_length)
    total_weights = 0
    while len(truck_weights) != 0:
        time += 1
        first_popped = bridges.popleft()
        total_weights -= first_popped
        if total_weights + truck_weights[0] <= weight:
            popped = truck_weights.popleft()
            total_weights += popped
            bridges.append(popped)
        else:
            bridges.append(0)
    
    return time + bridge_length