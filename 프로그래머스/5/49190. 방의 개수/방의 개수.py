from collections import defaultdict
from collections import deque

def solution(arrows):
    answer = 0

    directions = [(-1, 0), (-1, 1), (0, 1), (1, 1),
            (1, 0), (1, -1), (0, -1), (-1, -1)] # 방향을 담자!...
    visited = defaultdict(int)
    visited_path = defaultdict(int)

    queue = deque()
    queue.append((0,0))
    value = (0,0)
    for arrow in arrows:
        val = directions[arrow]
        for _ in range(2):
            moved = (value[0] + val[0], value[1] + val[1])
            queue.append(moved)
            value = moved

    now = queue.popleft()
    visited[now] = 1

    while queue:
        next = queue.popleft()

        if visited[next] == 1:
            if visited_path[(now, next)] == 0:
                answer += 1
        else:
            visited[next] = 1

        visited_path[(now, next)] += 1
        visited_path[(next, now)] += 1
        now = next

    return answer
