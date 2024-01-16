from collections import deque

n = int(input())
graph = []
start = 0
end = -100
dr = [0, 0, -1, 1]
dc = [1, -1, 0, 0]

for _ in range(n):
    inputing = list(map(int, input().split()))
    temp_max = max(inputing)
    graph.append(inputing)

    if end < temp_max:
        end = temp_max
answer = 0

def count_safe_area(value):
    visited = [[False for _ in range(n)] for _ in range(n)]
    count = 0

    for r in range(n):
        for c in range(n):
            if visited[r][c] == False and graph[r][c] > value: # 해당 value보다 큰 놈들은 싹다 True 처리해버리기!.
                count += 1
                visited[r][c] = True
                q = deque()
                q.append((r, c))

                while q:
                    popped = q.popleft()

                    for i in range(4):
                        next_r = popped[0] + dr[i]
                        next_c = popped[1] + dc[i]

                        if 0 <= next_r < n and 0 <= next_c < n:
                            if visited[next_r][next_c] == False and graph[next_r][next_c] > value:
                                q.append((next_r, next_c))
                                visited[next_r][next_c] = True
    return count

for i in range(start, end):
    temp_answer = count_safe_area(i)
    if temp_answer > answer:
        answer = temp_answer
print(answer)



