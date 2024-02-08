import copy

row_count, column_count = map(int, input().split())
board = []
visited = []
for _ in range(row_count):
    input_value = list(input())
    board.append(copy.deepcopy(input_value)) # 여기서 딥 카피를 해야된다!.. 안 그러면 visited에서 바뀐거가 board에도 적용이된다!..
    visited.append(input_value)
dr = [0, 0, 1, -1]
dc = [1, -1, 0, 0]
selected = []

def DFS(r, c):
    up = r
    down = r
    right = c
    left = c
    count = 0
    while True:
        up = up - 1 # row 하나 줄이기
        down = down + 1 # row 하나 올리기
        right = right + 1 # column 하나 올리기
        left = left - 1 # column 하나 내리기

        if 0 <= up < row_count and 0 <= down < row_count and 0 <= right < column_count and 0 <= left < column_count:
            if board[up][c] == "*" and board[down][c] == "*" and board[r][right] == "*" and board[r][left] == "*":
                count += 1
                visited[r][c] = "."
                visited[up][c] = "."
                visited[down][c] = "."
                visited[r][right] = "."
                visited[r][left] = "."
            else:
                break
        else:
            break

    return count


for r in range(row_count):
    for c in range(column_count):
        if board[r][c] == "*":
            count = DFS(r, c)
            if count != 0:
                for cnt in range(1, count+1):
                    selected.append([r+1, c+1, cnt])

for r in range(row_count):
    for c in range(column_count):
        if visited[r][c] == "*":
            print(-1)
            exit()

print(len(selected))
for value in selected:
    print(' '.join(map(str, value)))
