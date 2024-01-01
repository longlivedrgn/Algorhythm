from collections import deque

def solution(n, edge):
    answer = 0
    graph = [[] for _ in range(n+1)]
    visited = [False] * (n+1)
    for edg in edge:
        graph[edg[0]].append(edg[1])
        graph[edg[1]].append(edg[0])

    q = deque()
    nodeCount = []
    q.append((1,1))
    visited[1] = True

    while q:
        popped = q.popleft()

        for pop in graph[popped[0]]:
            if visited[pop] == False:
                visited[pop] = True
                q.append((pop, popped[1]+1))
                nodeCount.append(popped[1]+1)

    return nodeCount.count(max(nodeCount))