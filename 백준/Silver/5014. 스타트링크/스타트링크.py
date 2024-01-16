from collections import deque

end, now, destination, up, down = map(int, input().split())
visited = [False for _ in range(end+1)]
visited[now] = True

q = deque()
q.append((now, 0))

while q:
    popped = q.popleft()
    if popped[0] == destination:
        print(popped[1])
        exit(0)

    goUp = popped[0] + up
    goDown = popped[0] - down

    if 1 <= goUp <= end and visited[goUp] == False:
        visited[goUp] = True
        q.append((goUp, popped[1] +1))
    if 1 <= goDown <= end and visited[goDown] == False:
        visited[goDown] = True
        q.append((goDown, popped[1] +1))

print("use the stairs")


