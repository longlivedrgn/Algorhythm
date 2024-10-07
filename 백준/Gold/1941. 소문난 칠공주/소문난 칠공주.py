from itertools import combinations
from collections import deque

graph = []
answer = 0

for _ in range(5):
    graph.append(list(input()))
# 먼저 그래프의 가로, 세로의 길이가 5라는것에서 브루트포스를 사용해보는 게 좋다. -> 즉, 그냥 싹 다 체크해보기
# 십자 모양은 DFS를 돌리기에 조금 어렵다.
dr = [-1, 1, 0, 0]
dc = [0, 0, -1, 1]
all_points = []
for r in range(0, 5):
    for c in range(0, 5):
        all_points.append((r, c))
all_cases = list(combinations(all_points, 7))

def DaSomOverFour(case):
    global graph
    count = 0
    for c in case:
        if graph[c[0]][c[1]] == "Y":
            count += 1
        if count > 3:
            return False
    return True

def isAllAdjacent(case):
    # Set을 활용해서 visited를 했는 지 판단한다.
    check = set(case)
    start = case[0]

    q = deque()
    q.append(start)
    check.remove(start)

    while q:
        now_r, now_c = q.popleft()

        for i in range(4):
            next_r = now_r + dr[i]
            next_c = now_c + dc[i]

            if (next_r, next_c) in check:
                check.remove((next_r, next_c))
                q.append((next_r,next_c))
    if len(check) == 0:
        return True
    else:
        return False


for case in all_cases:
    if DaSomOverFour(case):
        if isAllAdjacent(case):
            answer += 1

print(answer)
