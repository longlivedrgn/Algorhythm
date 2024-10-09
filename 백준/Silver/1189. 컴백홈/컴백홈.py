R, C, K = map(int, input().split())
graph = []
for _ in range(R):
    graph.append(list(input()))
dr = [-1, 1, 0, 0]
dc = [0, 0, -1, 1]

visited = [[False for _ in range(C)] for _ in range(R)]
count = 0
def DFS(depth, r, c):
    global  count
    if depth == K and r == 0 and c == C-1:
        count += 1
        return

    for i in range(4):
        next_r = r + dr[i]
        next_c = c + dc[i]

        if 0 <= next_c < C and 0 <= next_r < R and not visited[next_r][next_c] and graph[next_r][next_c] != "T":
            visited[next_r][next_c] = True
            DFS(depth +1, next_r, next_c)
            visited[next_r][next_c] = False

visited[R-1][0] = True
DFS(1, R-1, 0)
print(count)

