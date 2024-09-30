from collections import deque
def solution(maps):
    answer = 0
    graph = []
    distance = [[0 for _ in range(len(maps[0]))] for _ in range(len(maps))]
    dr = [-1, 1, 0, 0]
    dc = [0, 0, -1, 1]
    # r, c
    start = []
    lever = []
    exit = []
    
    lever_distance = 0
    exit_distance = 0
    
    # 그래프 채우기
    for (r,map) in enumerate(maps):
        temp = []
        for (c, m) in enumerate(map):
            temp.append(m)
            if m == "L":
                lever.append(r)
                lever.append(c)
            elif m == "S":
                start.append(r)
                start.append(c)
            elif m == "E":
                exit.append(r)
                exit.append(c)                
        graph.append(temp)
    
    queue = deque()
    queue.append(start)
    
    # 여기서 lever까지의 거리 체킹
    isFound = False
    while queue:
        if isFound:
            break
        popped = queue.popleft()
        
        for i in range(4):
            if isFound:
                break
            next_r = popped[0] + dr[i]
            next_c = popped[1] + dc[i]
            
            if 0 <= next_r < len(maps) and 0 <= next_c < len(maps[0]) and distance[next_r][next_c] == 0:
                if graph[next_r][next_c] == "O" or graph[next_r][next_c] == "E":
                    distance[next_r][next_c] = distance[popped[0]][popped[1]] + 1
                    queue.append([next_r, next_c])
                elif graph[next_r][next_c] == "L":
                    distance[next_r][next_c] = distance[popped[0]][popped[1]] + 1
                    lever_distance = distance[next_r][next_c]
                    isFound = True
    if lever_distance == 0:
        return -1
    
    distance = [[0 for _ in range(len(maps[0]))] for _ in range(len(maps))]
    queue = deque()
    queue.append(lever)
    
    isFound = False
    while queue:
        if isFound:
            break
        popped = queue.popleft()
        
        for i in range(4):
            if isFound:
                break
            next_r = popped[0] + dr[i]
            next_c = popped[1] + dc[i]
            
            if 0 <= next_r < len(maps) and 0 <= next_c < len(maps[0]) and distance[next_r][next_c] == 0:
                if graph[next_r][next_c] == "O" or graph[next_r][next_c] == "S" :
                    distance[next_r][next_c] = distance[popped[0]][popped[1]] + 1
                    queue.append([next_r, next_c])
                elif graph[next_r][next_c] == "E":
                    distance[next_r][next_c] = distance[popped[0]][popped[1]] + 1
                    exit_distance = distance[next_r][next_c]
                    isFound = True
    if exit_distance == 0:
        return -1
    return exit_distance + lever_distance