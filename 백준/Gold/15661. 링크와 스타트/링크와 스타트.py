numbers = int(input())
board = []

for _ in range(numbers):
    board.append(list(map(int, input().split())))
visited = [False for _ in range(numbers)]

answer = 987654321

def DFS(start):
    global  answer
    A = 0
    B = 0
    for c in range(numbers):
        for r in range(numbers):
            if visited[c] == True and visited[r] == True:
                A += board[c][r]
            if visited[c] == False and visited[r] == False:
                B += board[c][r]

    tempAns = abs(A-B)
    if tempAns < answer:
        answer = tempAns

    for i in range(start, numbers):
        if visited[i] == False:
            visited[i] = True
            DFS(i)
            visited[i] = False



DFS(0)
print(answer)