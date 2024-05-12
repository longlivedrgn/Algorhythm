import heapq
import sys
input = sys.stdin.readline

def dijkstra(start):
    q = []
    heapq.heappush(q,(0,start)) # 처음 시작점을 넣어주기
    distance[start] = 0
    while q:
        dist, now = heapq.heappop(q) # 비용, 현재 어디?

        for i in graph[now]: # now에서 갈 수 있는 곳 탐색하기!~ -> 최단거리 업데이트하기
            # (도착점, 가는 비용)
            cost = dist + i[1]
            if cost < distance[i[0]]:
                distance[i[0]] = cost
                heapq.heappush(q,(cost, i[0]))

inf = int(1e9) # 일단 무한대로 싹다 초기화 해놓기

n , d = map(int,input().split())
graph = [[] for _ in range(d+1)]
distance = [inf] * (d+1)

#일단 거리 1로 초기화.
for i in range(d): # 전체 거리를 1로 초기화를 해놓는다.
    graph[i].append((i+1, 1)) # i번 노드에서 i+1번 노드로 가는 비용이 1이다.
    
for _ in range(n): # 지름길 체크하기
    s, e, l = map(int,input().split())
    if e > d:# 목적지를 지나친다. -> 무시하기
        continue
    graph[s].append((e,l)) # s번 노드에서 e 노드로 가는 비용이 l이다.
start = 0
dijkstra(start)
print(distance[d])