from collections import deque
def solution(x, y, n):
    q = deque()
    q.append((x, 0))
    visited = [ False for _ in range(1000002) ]
    ans = -1
    while q:
        popped_x, count = q.popleft()
        
        if popped_x == y:
            ans = count
            break
        first_x = popped_x + n
        second_x = popped_x * 2
        third_x = popped_x * 3
             
        if first_x < 1000001 and not visited[first_x] :
            visited[first_x] = True
            q.append((first_x, count+1))
        if second_x < 1000001 and not visited[second_x]:
            visited[second_x] = True
            q.append((second_x, count+1))
        if third_x < 1000001 and not visited[third_x]:
            visited[third_x] = True
            q.append((third_x, count+1))
    return ans
        