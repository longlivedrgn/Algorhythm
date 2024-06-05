from collections import deque
cities_count = int(input())
plan_cities_count = int(input())
cities = []
for _ in range(cities_count):
    cities.append(list(map(int, input().split())))
plan_cities = list(map(int, input().split()))

def BFS(start, end):
    visited = [False for _ in range(cities_count)]

    queue = deque()
    visited[start-1] = True
    queue.append(start)

    while queue:
        popped = queue.popleft()

        if popped == end:
            return True

        for (index,i) in enumerate(cities[popped-1]):
            if i == 1 and visited[index] == False:
                queue.append(index+1)
                visited[index] = True
    return False


for i in range(0, plan_cities_count-1):
    if not BFS(plan_cities[i], plan_cities[i+1]):
        print("NO")
        break
else:
    print("YES")


