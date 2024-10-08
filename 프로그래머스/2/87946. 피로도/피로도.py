def solution(k, dungeons):
    answer = 0
    length = len(dungeons)
    visited = [False for _ in range(length)]
    
    def DFS(blood, number):
        nonlocal answer
        answer = max(number, answer)
        for i in range(length):
            if not visited[i]:
                if blood >= dungeons[i][0] and blood - dungeons[i][1] >= 0:
                    visited[i] = True
                    DFS(blood-dungeons[i][1], number+1)
                    visited[i] = False
    DFS(k, 0)
    return answer