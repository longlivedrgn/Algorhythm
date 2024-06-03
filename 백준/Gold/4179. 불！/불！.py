import sys
from collections import deque

input = sys.stdin.readline
R, C = map(int, input().split())
graph = []

j_queue = deque()
fire_queue = deque()

visited_j = [[0] * C for _ in range(R)]
visited_f = [[0] * C for _ in range(R)]

dr = [-1, 1, 0, 0]
dc = [0, 0, -1, 1]

for i in range(R):
    temp = list(input())

    for j in range(C):
        if temp[j] == "J":
            j_queue.append((i, j))
            visited_j[i][j] = 1

        elif temp[j] == "F":
            fire_queue.append((i, j))
            visited_f[i][j] = 1

    graph.append(temp)

def BFS():
    while fire_queue:
        r, c = fire_queue.popleft()

        for i in range(4):
            nr = r + dr[i]
            nc = c + dc[i]

            if 0 <= nc < C and 0 <= nr < R:
                if not visited_f[nr][nc] and graph[nr][nc] != "#":
                    visited_f[nr][nc] = visited_f[r][c] + 1 # 해당 값은 fire가 거기에 도달하는데까지 걸린 시간이다.\
                    fire_queue.append((nr, nc))
    while j_queue:
        r, c = j_queue.popleft()

        for i in range(4):
            nr = r + dr[i]
            nc = c + dc[i]

            if 0 <= nr < R and 0 <= nc < C:
                # 1 -> True, 0 -> False
                # j에서 아직 방문하지 못한 곳으로 일단 간다.
                if graph[nr][nc] != "#" and not visited_j[nr][nc]:
                    # 아직 visited_fire가 0 이거나, 내가 +1보다 더 크다면?..
                    if not visited_f[nr][nc] or visited_f[nr][nc] > visited_j[r][c] + 1:
                        visited_j[nr][nc] = visited_j[r][c] + 1
                        j_queue.append((nr, nc))
            else:
                return visited_j[r][c]

    return "IMPOSSIBLE"

print(BFS())
