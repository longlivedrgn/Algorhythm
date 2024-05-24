import heapq
import sys

input = sys.stdin.readline
INF = int(1e9)

dr = [-1, 1, 0, 0]
dc = [0, 0, -1, 1]

def dijkstra():
    q = []
    distance[0][0] = 0
    heapq.heappush(q, (graph[0][0], 0, 0)) # distance, r, c

    while q:
        cost, r, c = heapq.heappop(q)
        if r == n-1 and c == n-1:
            print(f'Problem {count}: {cost}')
            break

        for i in range(4):
            n_r = r + dr[i]
            n_c = c + dc[i]

            if 0 <= n_r < n and 0 <= n_c < n:
                temp_cost = cost + graph[n_r][n_c]

                if distance[n_r][n_c] > temp_cost:
                    distance[n_r][n_c] = temp_cost
                    heapq.heappush(q, (distance[n_r][n_c], n_r, n_c))

count = 1

while True:
    n = int(input())
    if n == 0:
        break

    graph = [list(map(int, input().split())) for _ in range(n)]
    distance = [[INF] * n for _ in range(n)]

    dijkstra()
    count += 1