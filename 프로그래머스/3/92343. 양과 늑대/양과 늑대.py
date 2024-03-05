def solution(info, edges):
    answer = [] # 양의 갯수를 집어넣는 곳!..
    visited = [False for _ in range(len(info))]
    
    def DFS(sheep, wolf):
        if sheep > wolf:
            answer.append(sheep)
        else:
            return
        for (parent, child) in edges:
            if visited[parent] == True and visited[child] == False: # 이러면 방문을 할 수 있다.
                visited[child] = True # child를 방문했다고 빵 찍기!..
                if info[child] == 0:
                    DFS(sheep+1, wolf)
                else:
                    DFS(sheep, wolf+1)
                visited[child] = False
    visited[0] = True # 첫 번째 시작 sheep은 방문했다고 빵 찍기
    DFS(1, 0)
    print(answer)
    return max(answer)