import sys
from collections import deque

input = sys.stdin.readline

board = [list(input().rstrip()) for _ in range(12)]

dx = [1, -1, 0, 0]
dy = [0, 0, 1, -1]


def shift():
    for i in range(6):
        for j in range(11, 0, -1):
            if board[j][i] != ".":
                continue
            k = j-1
            while k >= 0:
                if board[k][i] == ".":
                    k -= 1
                    continue
                board[j][i] = board[k][i]
                board[k][i] = "."
                break


# 4칸 확인하는 함수 하나
def bfs(x, y):
    q = deque()
    q.append((x, y))
    temp.append((x, y))
    while q:
        a, b = q.popleft()
        for i in range(4):
            nx = a + dx[i]
            ny = b + dy[i]
            # 값이 동일하고 아직 방문을 하지 않았다면!
            if 0 <= nx < 12 and 0 <= ny < 6 and board[nx][ny] == board[x][y] and visited[nx][ny] == 0:
                q.append((nx, ny)) # queue에 다시 넣기!
                temp.append((nx, ny)) # 뿌요 박스에도 넣기!
                visited[nx][ny] = 1 # 방문했다고 빵 찍기!


# 4칸이상일 때 지우는 함수하나
def delete(temp):
    for row, column in temp:
        board[row][column] = "."


# def show(data):
#     for i in range(12):
#         print(data[i],end="\n")

ans = 0
while True:
    flag = False
    visited = [[False] * 6 for _ in range(12)]
    for row in range(12):
        for column in range(6):
            if board[row][column] != '.' and visited[row][column] == False:
                visited[row][column] = True
                temp = []
                bfs(row, column)
                # 만약 탐색결과 4칸 이상이라면!
                if len(temp) >= 4:
                    flag = True
                    delete(temp)
    if flag == False:
        break
    shift()
    ans += 1

print(ans)