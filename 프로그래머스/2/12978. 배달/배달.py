import heapq

def solution(N, road, K):
    INF = int(1e9)
    graph = [[] for _ in range(N+1)]
    distance = [INF] * (N+1)
    answer = 0
    
    for r in road:
        start = r[0]
        end = r[1]
        cost = r[2]
        graph[start].append((end, cost))
        graph[end].append((start, cost))
    
    q = []
    heapq.heappush(q, (0, 1))
    distance[1] = 0
    
    while q:
        dist, now = heapq.heappop(q)
        
        if dist <= distance[now]:
            for i in graph[now]:
                cost = dist + i[1]
                
                if cost < distance[i[0]]:
                    distance[i[0]] = cost
                    heapq.heappush(q, (cost, i[0]))
                    
    for d in distance:
        if d <= K:
            answer += 1
    return answer