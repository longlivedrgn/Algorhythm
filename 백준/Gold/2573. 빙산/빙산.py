from collections import deque
answer = 0
R, C = map(int, input().split())
board = []
for _ in range(R):
    board.append(list(map(int, input().split())))

dr = [-1, 1, 0, 0]
dc = [0, 0, -1, 1]

def BFS(start):
    queue = deque()
    queue.append(start)

    while queue:
        popped = queue.popleft()

        for i in range(4):
            n_c = popped[1] + dc[i]
            n_r = popped[0] + dr[i]

            if 0 <= n_c < C and 0 <= n_r < R and board[n_r][n_c] != 0 and visited[n_r][n_c] == False:
                visited[n_r][n_c] = True
                queue.append((n_r, n_c))


while True:
    melting_point = []
    for c in range(C):
        for r in range(R):
            if board[r][c] != 0: # 얼음이 존재한다.
                zero_count = 0
                for i in range(4):
                    n_r = r + dr[i]
                    n_c = c + dc[i]

                    if 0 <= n_c < C and 0 <= n_r < R:
                        if board[n_r][n_c] == 0:
                            zero_count += 1
                melting_point.append((r, c, zero_count))

    for melt in melting_point:
        r = melt[0]
        c = melt[1]

        board[r][c] -= melt[2]

        if board[r][c] < 0:
            board[r][c] = 0

    answer += 1

    # 빙산의 갯수를 찾자!...
    visited = [[False for _ in range(C)] for _ in range(R)]
    island_count = 0
    for c in range(C):
        for r in range(R):
            if board[r][c] != 0 and visited[r][c] == False:
                island_count += 1
                visited[r][c] = True
                BFS((r,c))

    if island_count == 0:
        answer = 0
        break
    if island_count >= 2:
        break
print(answer)




