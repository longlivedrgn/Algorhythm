from collections import deque


def DFS(start, computers, visited):
    for (idx, computer) in enumerate(computers[start]):
        if visited[idx] == False and computer == 1:
            visited[idx] = True
            DFS(idx, computers, visited)
        

def solution(n, computers):
    answer = 0
    visited = [False for _ in range(n)]
    
    for i in range(n):
        if visited[i] == False:
            DFS(i, computers, visited)
            answer += 1
    return answer        