from collections import deque
def solution(order):
    ans = 0
    i = 1
    q = deque()
    while i < len(order) + 1:
        q.append(i)
        while len(q) != 0 and q[-1] == order[ans]:
            q.pop()
            ans += 1
        i += 1
    return ans