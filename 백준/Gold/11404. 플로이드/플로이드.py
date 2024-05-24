import sys
INF = int(1e9)
input = sys.stdin.readline
n = int(input())
m = int(input())
graph = [[INF for _ in range(n+1)] for _ in range(n+1)]

for r in range(n+1):
    for c in range(n+1):
        if r == c:
            graph[r][c] = 0

for _ in range(m):
    a, b, c = map(int, input().split())
    graph[a][b] = min(graph[a][b], c)

for k in range(n+1):
    for c in range(n+1):
        for r in range(n+1):
            graph[r][c] = min(graph[r][c], graph[r][k] + graph[k][c])
for c in range(n+1):
    for r in range(n+1):
        if graph[r][c] == INF:
            graph[r][c] = 0
for i in range(1,n+1):
    # print(graph[i])
    print(" ".join(map(str,graph[i][1:])))
    # print("".join(graph[i]))
