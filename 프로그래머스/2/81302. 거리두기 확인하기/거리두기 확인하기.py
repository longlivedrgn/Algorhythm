from collections import deque

dc = [1, -1, 0, 0]
dr = [0, 0, 1, -1]

def solution(places):
    answer = []
    for place in places:
        allPs = []
        for r in range(5):
            for c in range(5):
                if place[r][c] == "P":
                    allPs.append((r, c))
        flag = False # 만약 거리 두기가 지켜지지 않으면 바로 true로 변경!

        for p in allPs:
            visited = [[0 for _ in range(5)] for _ in range(5)] # 방문하면 1로 빵 찍기!..
            distance = [[0 for _ in range(5)] for _ in range(5)] # 거기까지 가는 데 걸리는 거리~!
            
            if flag == True: # 만약 이미 거리두기가 지켜지지 않았으면 그냥 끝내기!..
                break
            
            q = deque()
            q.append(p)
            visited[p[0]][p[1]] = 1 # 처음 시작점은 방문했다고 빵 찍기!
            
            while q:
                popped = q.popleft()
                
                if flag == True:
                    break

                for t in range(4):
                    current_r = popped[0]
                    current_c = popped[1]
                    next_r = current_r + dr[t]
                    next_c = current_c + dc[t]
                    
                    if 0 <= next_c < 5 and 0 <= next_r < 5 and visited[next_r][next_c] == 0:
                            if place[next_r][next_c] == "O": # 탁자이므로 갈 수 있다.
                                visited[next_r][next_c] = 1 # 방문했다고 빵찍기!..
                                distance[next_r][next_c] = distance[current_r][current_c] + 1
                                q.append((next_r, next_c))
                            if place[next_r][next_c] == "P": # 다음에 갈 곳이 P라면!!.. 
                                if distance[current_r][current_c] <= 1: # 현재 내 거리에서 2안에 갈 수 있으므로 거리두기 위반!.. 즉, 2보다 작다면!..
                                    answer.append(0)
                                    flag = True
                                    break
        if flag == False: # 만약 싹 다 돌았는데, p끼리 2안에 갈 수 없었다면?
            answer.append(1)   
        
    return answer