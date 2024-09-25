import heapq

def dijkstra(start):
    distance = [float('inf')] * (N+1)
    distance[start] = 0
    q = []								    
    heapq.heappush(q, (0, start))				
    while q:
        dist, now = heapq.heappop(q)		
        if distance[now] >= dist:			
            for next, val in graph[now]:	
                if dist + val < distance[next]:
                    distance[next] = dist + val
                    heapq.heappush(q, (dist + val, next))
    return distance

N, M, X = map(int, input().split())
graph = [[] for _ in range(N + 1)]
for _ in range(M):
    a, b, t = map(int, input().split())
    graph[a].append([b, t])
ans = dijkstra(X)
ans[0] = 0
for i in range(1, N+1):
    if i != X:
        res = dijkstra(i)
        ans[i] += res[X]

print(max(ans))