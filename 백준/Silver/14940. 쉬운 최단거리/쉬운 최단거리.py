from collections import deque
row, column = map(int, input().split())

# 2D 리스트를 생성하여 행렬을 저장
matrix = []
dr = [-1, 1, 0, 0]
dc = [0, 0, -1, 1]

# n개의 행을 읽어들임
for _ in range(row):
    # 각 행의 요소들을 정수로 변환하여 리스트에 추가
    r = list(map(int, input().split()))
    matrix.append(r)

visited = [[False for _ in range(column)] for _ in range(row)]
ans = [[0]*column for _ in range(row)]

for r in range(row):
    for c in range(column):
        if matrix[r][c] == 2:
            visited[r][c] = True
            queue = deque()
            queue.append((r, c))

            while queue:
                popped_r, popped_c = queue.popleft()

                for i in range(4):
                    next_r = popped_r + dr[i]
                    next_c = popped_c + dc[i]

                    if 0 <= next_r < row and 0 <= next_c < column:
                        if visited[next_r][next_c] == False and matrix[next_r][next_c] == 1:
                            visited[next_r][next_c] = True
                            ans[next_r][next_c] = ans[popped_r][popped_c] + 1
                            queue.append((next_r, next_c))

for r in range(row):
    for c in range(column):
        if visited[r][c] == False and matrix[r][c] == 1:
            print(-1,end=" ")
        else:
            print(ans[r][c], end=" ")
    print()