import heapq




def solution(N, road, K):
    answer = 0
    graph = [[] for _ in range(N+1)]
    distance = [int(1e9)] * (N+1)

    for r in road:
        graph[r[0]].append((r[1], r[2]))
        graph[r[1]].append((r[0], r[2]))
    # [실행] 버튼을 누르면 출력 값을 볼 수 있습니다.
    def dij(start):
        q = []
        heapq.heappush(q, (0, start))
        distance[start] = 0
        while q:
            dist, now = heapq.heappop(q)
            if distance[now] >= dist:
                for i in graph[now]:
                    cost = i[1] + distance[now]
                    if cost < distance[i[0]]:
                        distance[i[0]] = cost
                        heapq.heappush(q, (cost, i[0]))
    dij(1)

    for m in range(1, N+1):
        if distance[m] <= K:
            answer += 1

    return answer