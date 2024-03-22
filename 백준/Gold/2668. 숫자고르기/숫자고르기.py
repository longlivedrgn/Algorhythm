N = int(input())
bottom = [0]
def DFS(current, start, visited):
    visited[current] = True
    node = bottom[current]
    if visited[node] == True and node == start:
        # 이러면 start는 다시 순회해서 돌아온 것이다. 그러므로 result에 넣어준다.
        result.append(start)
    elif visited[node] == False:
        # 방문하지 않았으니 끝까지 한번 가본다!
        DFS(node, start, visited)


for _ in range(N):
    temp = int(input())
    bottom.append(temp)

# 자기 자신한테 돌아오는 놈들을 result에 넣어준다.
result = []
for i in range(1, N+1): # 1 ~ N 까지 순회한다.
    visited = [False for _ in range(N+1)]
    DFS(i, i, visited)
print(len(result))
result.sort()
for i in result:
    print(i)
