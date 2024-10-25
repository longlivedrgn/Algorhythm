number = int(input())
board = []
answer = int(1e9)
for _ in range(number):
    board.append(list(map(int, input().split())))
visited = [False for _ in range(number)]
def DFS(depth, start):
    global answer
    if depth == number // 2:
        A = 0
        B = 0

        for i in range(number):
            for j in range(number):
                if visited[i] and visited[j]:
                    A += board[i][j]
                if not visited[i] and not visited[j]:
                    B += board[i][j]
        answer = min(answer, abs(A-B))
        return

    for v in range(start, number):
        visited[v] = True
        DFS(depth+1, v+1)
        visited[v] = False

DFS(0, 0)
print(answer)