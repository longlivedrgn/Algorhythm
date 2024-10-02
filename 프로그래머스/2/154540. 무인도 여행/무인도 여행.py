from collections import deque
dr = [-1, 1, 0, 0]
dc = [0, 0, -1, 1]
def solution(maps):
    answer = []
    graph = [[0 for _ in range(len(maps[0]))] for _ in range(len(maps))]
    visited = [[False for _ in range(len(maps[0]))] for _ in range(len(maps))]
    for (r, map) in enumerate(maps):
        for (c, m) in enumerate(map):
            if m == "X":
                graph[r][c] = 0
                visited[r][c] = True
            else:
                graph[r][c] = int(m)
    for r in range(len(maps)):
        for c in range(len(maps[0])):
            if visited[r][c] == False:
                count = graph[r][c]
                q = deque()
                q.append([r,c])
                visited[r][c] = True
                
                while q:
                    popped_r, popped_c = q.popleft()
                    
                    for i in range(4):
                        next_r = popped_r + dr[i]
                        next_c = popped_c + dc[i]
                        
                        if 0 <= next_r < len(maps) and 0 <= next_c < len(maps[0]) and visited[next_r][next_c] == False:
                            
                            visited[next_r][next_c] = True
                            count += graph[next_r][next_c]
                            q.append([next_r, next_c])
                answer.append(count)
                
        answer.sort()
        if len(answer) == 0:
            return [-1]
                            
                    
                
            
    return answer