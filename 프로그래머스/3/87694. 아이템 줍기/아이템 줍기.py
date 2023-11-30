from collections import deque

def solution(rectangle, characterX, characterY, itemX, itemY):
    answer = 0
    # 전체를 *2 해서 먼저 판을 만든다. 그리고 아이템 좌표랑 캐릭터의 자표도 *2를 해야된다.
    # 전체는 -1로 테두리는 1 안은 0으로 구현한다.
    
    maps = [[-1 for _ in range(110)] for _ in range(110)]
    visited = [[0 for _ in range(110)] for _ in range(110)]
    dx = [0, 0, -1, 1]
    dy = [-1, 1, 0, 0]
    
    for rect in rectangle:
        x_one, y_one, x_two, y_two = map(lambda x: x*2, rect)
        
        for x in range(x_one, x_two+1):
            for y in range(y_one, y_two+1):
                if x_one < x < x_two and y_one < y < y_two:
                    maps[y][x] = 0
                else:
                    if maps[y][x] != 0:
                        maps[y][x] = 1
    
    item_x = itemX * 2
    item_y = itemY * 2
    character_x = characterX * 2
    character_y = characterY * 2
    
    queue = deque()
    queue.append((character_x, character_y))
    
    while queue:
        x, y = queue.popleft()
        
        if x == item_x and y == item_y:
            answer = visited[y][x] // 2
            break
        
        for i in range(4):
            nx = x + dx[i]
            ny = y + dy[i]
            
            if 0 <= nx <= 110 and 0 <= ny <= 110:
                if visited[ny][nx] == 0 and maps[ny][nx] == 1:
                    visited[ny][nx] = visited[y][x] + 1
                    queue.append((nx, ny))
    
    return answer