from collections import deque
def solution(skill, skill_trees):
    answer = 0
    for tree in skill_trees:
        q = deque()
        for s in skill:
            q.append(s)
        for t in tree:
            if t in q:
                if q[0] != t:
                    break
                else:
                    q.popleft()
        else:
            answer += 1
                    
            
    return answer