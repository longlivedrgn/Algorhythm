from collections import deque
import sys

dr = [-1, 1, 0, 0]
dc = [0, 0, -1, 1]

def solution(land):
    answer = 0
    height = len(land)
    length = len(land[0])
    result = [0 for _ in range(length)]
    visited = [[False for _ in range(length)] for _ in range(height)]

    for c in range(length):
        for r in range(height):
            if land[r][c] == 1 and visited[r][c] == False:
                q = deque()
                q.append((r, c))
                visited[r][c] = True
                area = 1
                startC = c
                endC = - sys.maxsize
                while q:
                    popped = q.popleft()
                    endC = max(endC, popped[1])

                    for i in range(4):
                        n_r = popped[0] + dr[i]
                        n_c = popped[1] + dc[i]
                        if 0 <= n_c < length and 0 <= n_r < height:
                            if visited[n_r][n_c] == False and land[n_r][n_c] == 1:
                                q.append((n_r, n_c))
                                visited[n_r][n_c] = True
                                area += 1
                for m in range(startC, endC+1):
                    result[m] += area
    return max(result)