dr = [-1, 1, 0, 0]
dc = [0, 0, -1, 1]

from collections import deque

def solution(board):
    answer = 0
    graph = []
    start_r = 0
    start_c = 0
    row_count = len(board)
    column_count = len(board[0])
    visited = [[0 for _ in range(column_count)] for _ in range(row_count)]
    print(visited)
    for (row, boa) in enumerate(board):
        row_list = []
        for (col, b) in enumerate(boa):
            if b == "R":
                start_r = row
                start_c = col
            row_list.append(b)
        graph.append(row_list)
    
    queue = deque()
    queue.append([start_r, start_c])
    visited[start_r][start_c] = 1
    
    while queue:
        now_r, now_c = queue.popleft()
        
        if graph[now_r][now_c] == "G":
            return visited[now_r][now_c] -1
        
        for i in range(4):
            temp_r, temp_c = now_r, now_c
            
            while True:
                temp_r += dr[i]
                temp_c += dc[i]
                
                if 0 <= temp_r < row_count and 0 <= temp_c < column_count and graph[temp_r][temp_c] == "D":
                    temp_r -= dr[i]
                    temp_c -= dc[i]
                    break
                if temp_r < 0 or temp_c < 0 or temp_r >= row_count or temp_c >= column_count:
                    temp_r -= dr[i]
                    temp_c -= dc[i]
                    break
            if not visited[temp_r][temp_c]:
                visited[temp_r][temp_c] = visited[now_r][now_c] + 1
                queue.append([temp_r, temp_c])
    return -1