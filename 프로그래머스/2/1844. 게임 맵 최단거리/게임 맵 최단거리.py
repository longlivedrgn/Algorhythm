from collections import deque

def solution(maps):

    dx = [0, 0, 1, -1]
    dy = [1, -1, 0, 0]

    map_row = len(maps[0])
    map_column = len(maps)

    queue = deque()
    queue.append([0, 0])

    while queue:
        popped = queue.popleft()
        for tmp in range(4):
            x = popped[0] + dx[tmp]
            y = popped[1] + dy[tmp]

            if 0 <= x < map_row and 0 <= y < map_column:
                if maps[y][x] == 1:
                    maps[y][x] = maps[popped[1]][popped[0]] + 1
                    queue.append([x, y])

    asnwer = maps[map_column - 1][map_row - 1]

    if asnwer == 1:
        return -1
    else:
        return asnwer

