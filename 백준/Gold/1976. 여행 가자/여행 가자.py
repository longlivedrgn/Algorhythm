from collections import deque

cities_count = int(input())
plan_count = int(input())
cities = []
for _ in range(cities_count):
    cities.append(list(map(int, input().split())))
plans = list(map(int, input().split()))


def BFS(start, end): # 1, 2
    visited = [False for _ in range(cities_count)]
    visited[start-1] = True
    q = deque()
    q.append(start-1)
    isFound = False
    while q:
        popped = q.popleft()
        if popped == end-1:
            isFound = True
            break

        for (idx,m) in enumerate(cities[popped]):
            if m == 1 and visited[idx] == False:
                visited[idx] = True
                q.append(idx)
    return isFound


for i in range(0, plan_count -1):
    if not BFS(plans[i], plans[i+1]):
        print("NO")
        break
else:
    print("YES")