from collections import deque
def solution(x, y, n):
    answer = 0
    arr = [0 for i in range(y+1)]
    queue = deque()
    queue.append(x)
    
    if x == y:
        return 0
    
    while queue:
        popped = queue.popleft()
        next_1 = popped + n
        next_2 = popped * 2
        next_3 = popped * 3
        
        if next_1 <= y and (arr[next_1] > arr[popped]+1 or arr[next_1] == 0):
            arr[next_1] = arr[popped]+1
            queue.append(next_1)
        if next_2 <= y and (arr[next_2] > arr[popped]+1 or arr[next_2] == 0):
            arr[next_2] = arr[popped]+1
            queue.append(next_2)
        if next_3 <= y and (arr[next_3] > arr[popped]+1 or arr[next_3] == 0):
            arr[next_3] = arr[popped]+1
            queue.append(next_3)
    if arr[y] == 0:
        return -1
    else:
        return arr[y]