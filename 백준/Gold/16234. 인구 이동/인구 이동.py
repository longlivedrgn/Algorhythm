from collections import deque
N, L, R = map(int, input().split())
board = []
for _ in range(N):
    board.append(list(map(int, input().split())))

dr = [-1, 1, 0, 0]
dc = [0, 0, -1, 1]
count = -1

while True:
    count += 1
    visited = [[False for _ in range(N)] for _ in range(N)]
    unions = []
    for r in range(N):
        for c in range(N):
            if visited[r][c] == False:
                visited[r][c] = True
                temp_union = []
                queue = deque()
                queue.append([r, c])
                temp_union.append([r, c])
                while queue:
                    temp_r, temp_c = queue.popleft()
                    for i in range(4):
                        next_r = temp_r + dr[i]
                        next_c = temp_c + dc[i]

                        if 0 <= next_r < N and 0 <= next_c < N and visited[next_r][next_c] == False:

                            if L <= abs(board[temp_r][temp_c] - board[next_r][next_c]) <= R:
                                visited[next_r][next_c] = True
                                temp_union.append([next_r, next_c])
                                queue.append([next_r, next_c])
                if len(temp_union) != 1:
                    unions.append(temp_union)
    # 만약 연합이 없으면 그냥 끝내기!
    if len(unions) == 0:
        print(count)
        break
    # 각 union들끼리 계산해서 연합만들기!
    for union in unions:
        temp_sum = 0
        for country in union:
            temp_sum += board[country[0]][country[1]]
        calculated = temp_sum // len(union)

        for country in union:
            board[country[0]][country[1]] = calculated


