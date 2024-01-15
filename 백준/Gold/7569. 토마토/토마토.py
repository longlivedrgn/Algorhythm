from collections import deque
m, n, h = map(int, input().split())

graph = []
q = deque()

for height in range(1,h+1):
    temp = []
    for nn in range(1, n+1):
        tomatos = list(map(int, input().split()))
        temp.append(tomatos)
    graph.append(temp)
isAllRiped = True
for height in range(h):
    for column in range(n):
        for row in range(m):
            if graph[height][column][row] == 0:
                isAllRiped = False
            if graph[height][column][row] == 1:
                q.append((height, column, row, 0))

dr = [-1, 1, 0 ,0]
dc = [0, 0, 1, -1]
if isAllRiped == True:
    print(0)
else:
    while q:
        height, column, row, day = q.popleft()
        for i in range(4):
            moved_r = row + dr[i]
            moved_c = column + dc[i]

            if 0 <= moved_r < m and 0 <= moved_c < n:
                if graph[height][moved_c][moved_r] == 0:
                    graph[height][moved_c][moved_r] = day + 1
                    q.append((height, moved_c, moved_r, day + 1))

        if 0 <= height - 1 < h: # 한층 아래 확인하기
            if graph[height-1][column][row] == 0:
                graph[height-1][column][row] = day + 1
                q.append((height-1, column, row, day +1))

        if 0 <= height + 1 < h: # 한층 아래 확인하기
            if graph[height+1][column][row] == 0:
                graph[height+1][column][row] = day + 1
                q.append((height+1, column, row, day +1))
    answer = 0
    isRiped = True
    for height in range(h):
        for column in range(n):
            for row in range(m):
                if graph[height][column][row] > answer:
                    answer = graph[height][column][row]
                if graph[height][column][row] == 0:
                    isRiped = False
    if isRiped == False:
        print(-1)
    else:
        print(answer)









