from collections import deque

n, m = list(map(int, input().split())) # n -> row, m -> column
graph = [list(map(int, input().split())) for _ in range(n)]

dr = [0, 0, -1, 1]
dc = [1, -1, 0, 0]

# 먼저 얼음을 담는다!..
ice = []

for r in range(n):
    for c in range(m):
        if graph[r][c]:
            ice.append((r, c))

year = 0

def BFS(r, c):
    q = deque()
    q.append((r,c))
    visited[r][c] = True
    seaList = []

    while q:
        x, y = q.popleft()
        sea = 0
        for i in range(4):
            nx = x + dc[i]
            ny = y + dr[i]

            if 0 <= nx < n and 0 <= ny < m:
                if graph[nx][ny] == 0 : # 만약 해당 공간이 바다라면? 바다 갯수 +1 하기
                    sea += 1
                elif graph[nx][ny] != 0 and not visited[nx][ny]: # 만약 해당 공간이 바다가 아닌데, 방문도 안한 곳이라면?
                    q.append((nx, ny)) # 그러면 해당 공간을 큐에 넣어버리기
                    visited[nx][ny] = 1 # 그리고 방문했다고 빵 찍기!..

        if sea > 0 :
            seaList.append((x, y, sea)) # 없애야되는 갯수와 함께 넣어준다.
    for x, y, sea in seaList:
        graph[x][y] = max(0, graph[x][y] - sea)

    return 1 # 해당 start에서 bfs를 돌렸으므로, start와 이어진 곳만 빙 돈다!..

island_group = 0

while ice:
    visited = [[False] * m for _ in range(n)]
    deleted_ice = [] # 0이 되어서 제거가된 ice 모음
    island_group = 0 # 섬의 갯수!..

    for r, c in ice:
        if graph[r][c] != 0 and visited[r][c] == False: # 해당 공간이 바다가 아니고, 방문도 안했다면?
            island_group += BFS(r, c) # 해당 공간을 기준으로 BFS를 돌리고, island 갯수를 하나 올린다.
        if graph[r][c] == 0: # 바다가 되어버린 빙산을 체크한다.
            deleted_ice.append((r, c))

    if island_group > 1: # 만약 island 그룹이 2개 이상이면 year를 출력한다.
        print(year)
        break

    ice = sorted(list(set(ice)-set(deleted_ice))) # 다시 남은 ice들을 계산한다.
    year += 1

if island_group < 2:
    print(0)
