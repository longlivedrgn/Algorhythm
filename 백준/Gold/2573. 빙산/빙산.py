from collections import deque

inputs = list(map(int, input().split()))
row = inputs[0]
column = inputs[1]

graph = []
for _ in range(row):
    graph.append(list(map(int, input().split())))

dr = [-1, 1, 0, 0]
dc = [0, 0, -1, 1]

year = -1


while True:
    year += 1

    visited = [[False for _ in range(column)] for _ in range(row)]

    def BFS(start):
        queue = deque()
        queue.append(start)

        while queue:
            r, c = queue.popleft()

            for i in range(4):
                next_r = r + dr[i]
                next_c = c + dc[i]

                if 0 <= next_r < row and 0 <= next_c < column:
                    if graph[next_r][next_c] != 0 and visited[next_r][next_c] == False:
                        queue.append([next_r, next_c])
                        visited[next_r][next_c] = True

    island = 0
    for r in range(row):
        for c in range(column):
            if graph[r][c] != 0 and visited[r][c] == False:
                island += 1
                BFS([r, c])

    if island >= 2:
        print(year)
        break
    if island == 0:
        print(0)
        break

    # 싹 다 돌아서 어느 좌표에서 녹는 지를 담아두고, 한번에 다 녹여버린다.
    # 그리고, 2개로 나누어져있는 지 판단하기
    melting_list = []

    # melting_list 채우기
    for r in range(row):
        for c in range(column):
            if graph[r][c] != 0:
                # 주변에 0이 몇 개인지를 확인한다.
                count = 0

                for i in range(4):
                    next_r = r + dr[i]
                    next_c = c + dc[i]

                    if 0 <= next_r < row and 0 <= next_c < column:
                        if graph[next_r][next_c] == 0:
                            count += 1
                melting_list.append([r, c, count])

    # melting_list에 있는 거 싹 다 지우기
    for melt in melting_list:
        graph[melt[0]][melt[1]] = max(0, graph[melt[0]][melt[1]] - melt[2])