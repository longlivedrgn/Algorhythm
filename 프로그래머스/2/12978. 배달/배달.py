import heapq

def solution(N, road, K):
    INF = int(1e9)
    graph = [[] for _ in range(N+1)]
    distance = [INF for _ in range(N+1)]
    answer = 0 
    for r in road:
        graph[r[0]].append((r[1], r[2]))
        graph[r[1]].append((r[0], r[2]))
    
    def dij(start):
        # global graph, distance
        q = []
        heapq.heappush(q, (0, start))
        distance[start] = 0
        
        while q:
            dist, now = heapq.heappop(q)
            if dist <= distance[now]:
                for i in graph[now]:
                    cost = dist + i[1]
                    if cost < distance[i[0]]:
                        distance[i[0]] = cost
                        heapq.heappush(q, (cost, i[0]))
    dij(1)
    for d in distance:
        if d <= K:
            answer += 1
    return answer
            
        
        